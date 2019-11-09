unit Comparers.Core;

interface

uses
  System.SysUtils, System.Types, System.TypInfo;

type
  IComparer<T> = interface
    ['{F2F892F1-3BF8-4BC3-97AE-D106BDE82A43}']
    function Compare(const AFirst, ASecond: T): TValueRelationship;
    function Equal(const AFirst, ASecond: T): Boolean;
  end;

  TComparer<T> = class abstract(TInterfacedObject, IComparer<T>)
  private class var
    FDefaults: array [TTypeKind] of TInterfacedClass;
    function GetDefaults(const ATypeKind: TTypeKind): TInterfacedClass;
  protected
    property Defaults[const ATypeKind: TTypeKind]: TInterfacedClass read GetDefaults;
  public
    class procedure RegisterAsDefault;
    class function Default: TComparer<T>;
    { IComparer<T> }
    function Compare(const AFirst, ASecond: T): TValueRelationship; virtual; abstract;
    function Equal(const AFirst, ASecond: T): Boolean; virtual;
  end;

  TCustomComparer<T> = class(TComparer<T>)
  private
    FCompareFunc: TFunc<T, T, TValueRelationship>;
    FEqualFunc: TFunc<T, T, Boolean>;
  public
    property CompareFunc: TFunc<T, T, TValueRelationship> read FCompareFunc write FCompareFunc;
    property EqualFunc: TFunc<T, T, Boolean> read FEqualFunc write FEqualFunc;
    constructor Create(const ACompareFunc: TFunc<T, T, TValueRelationship>; const AEqualsFunc: TFunc<T, T, Boolean>);
    { IComparer<T> }
    function Compare(const AFirst, ASecond: T): TValueRelationship; override;
    function Equal(const AFirst, ASecond: T): Boolean; override;
  end;

  TValueRelationshipHelper = record helper for TValueRelationship
  public
    function Inverted(const AInverted: Boolean): TValueRelationship;
  end;

implementation

{ TComparer<T> }

class function TComparer<T>.Default: TComparer<T>;
var
  LComparerClass: TInterfacedClass;
begin
  LComparerClass := FDefaults[PTypeInfo(TypeInfo(T)).Kind];
  if Assigned(LComparerClass) then
  begin
    Result := FDefaults[PTypeInfo(TypeInfo(T)).Kind].Create as TComparer<T>;
  end else
  begin
    Result := System.Default(TInterfacedClass);
  end;
end;

function TComparer<T>.Equal(const AFirst, ASecond: T): Boolean;
begin
  Result := Compare(AFirst, ASecond) = EqualsValue;
end;

function TComparer<T>.GetDefaults(const ATypeKind: TTypeKind): TInterfacedClass;
begin
  Result := FDefaults[ATypeKind];
end;

class procedure TComparer<T>.RegisterAsDefault;
begin
  FDefaults[PTypeInfo(TypeInfo(T)).Kind] := Self;
end;

{ TCustomComparer<T> }

function TCustomComparer<T>.Compare(const AFirst,
  ASecond: T): TValueRelationship;
begin
  Result := CompareFunc(AFirst, ASecond);
end;

constructor TCustomComparer<T>.Create(
  const ACompareFunc: TFunc<T, T, TValueRelationship>;
  const AEqualsFunc: TFunc<T, T, Boolean>);
begin
  inherited Create;
  CompareFunc := ACompareFunc;
  EqualFunc := AEqualsFunc;
end;

function TCustomComparer<T>.Equal(const AFirst, ASecond: T): Boolean;
begin
  Result := EqualFunc(AFirst, ASecond);
end;

{ TValueRelationshipHelper }

function TValueRelationshipHelper.Inverted(
  const AInverted: Boolean): TValueRelationship;
begin
  if AInverted then
  begin
    Result := -Self;
  end else
  begin
    Result := Self;
  end;
end;

end.
