unit Comparers.Defaults;

interface

uses
  System.SysUtils, System.Math, System.Types, System.AnsiStrings,
  Comparers.Core, Structures.Core;

type
  TIntegerComparer = class(TComparer<Integer>)
  private
    FIgnoreSign: Boolean;
  public
    property IgnoreSign: Boolean read FIgnoreSign write FIgnoreSign default False;
    constructor Create(const AIgnoreSign: Boolean = False);
    { TComparer<T> }
    function Compare(const AFirst, ASecond: Integer): TValueRelationship; override;
  end;

  TExtendedComparer = class(TComparer<Extended>)
  private
    FIgnoreSign: Boolean;
    FInaccuracy: Extended;
  public
    property IgnoreSign: Boolean read FIgnoreSign write FIgnoreSign default False;
    property Inaccuracy: Extended read FInaccuracy write FInaccuracy;
    constructor Create(const AIgnoreSign: Boolean = False; const AInaccuracy: Extended = 0);
    { TComparer<T> }
    function Compare(const AFirst, ASecond: Extended): TValueRelationship; override;
    function Equal(const AFirst, ASecond: Extended): Boolean; override;
  end;

  TCharComparer = class(TComparer<Char>)
  private
    FIgnoreCase: Boolean;
  public
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase default False;
    constructor Create(const AIgnoreCase: Boolean = False);
    { TComparer<T> }
    function Compare(const AFirst, ASecond: Char): TValueRelationship; override;
  end;

  TStringComparer = class(TComparer<String>)
  private
    FIgnoreCase: Boolean;
  public
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase default False;
    constructor Create(const AIgnoreCase: Boolean = False);
    { TComparer<T> }
    function Compare(const AFirst, ASecond: String): TValueRelationship; override;
  end;

  TAnsiStringComparer = class(TComparer<String>)
  private
    FIgnoreCase: Boolean;
  public
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase default False;
    constructor Create(const AIgnoreCase: Boolean = False);
    { TComparer<T> }
    function Compare(const AFirst, ASecond: String): TValueRelationship; override;
  end;

  TPointerComparer = class(TComparer<Pointer>)
  public
    { TComparer<T> }
    function Compare(const AFirst, ASecond: Pointer): TValueRelationship; override;
  end;

  TArrayComparer<T> = class(TComparer<TArray<T>>)
  public
    { TComparer<T> }
    function Compare(const AFirst, ASecond: TArray<T>): TValueRelationship; override;
  end;

  TRecordComparer<T: record> = class(TComparer<T>)
  public
    { TComparer<T> }
    function Compare(const AFirst, ASecond: T): TValueRelationship; override;
    function Equal(const AFirst, ASecond: T): Boolean; override;
  end;

  TObjectComparer<T: class> = class(TComparer<T>)
  public
    { TComparer<T> }
    function Compare(const AFirst, ASecond: T): TValueRelationship; override;
    function Equal(const AFirst, ASecond: T): Boolean; override;
  end;

implementation

{ TIntegerComparer }

function TIntegerComparer.Compare(const AFirst,
  ASecond: Integer): TValueRelationship;
begin
  if IgnoreSign then
  begin
    Result := CompareValue(Abs(AFirst), Abs(ASecond));
  end else
  begin
    Result := CompareValue(AFirst, ASecond);
  end;
end;

constructor TIntegerComparer.Create(const AIgnoreSign: Boolean = False);
begin
  inherited Create;
  IgnoreSign := AIgnoreSign;
end;

{ TExtendedComparer }

function TExtendedComparer.Compare(const AFirst,
  ASecond: Extended): TValueRelationship;
begin
  if IgnoreSign then
  begin
    Result := CompareValue(Abs(AFirst), Abs(ASecond), Inaccuracy);
  end else
  begin
    Result := CompareValue(AFirst, ASecond, Inaccuracy);
  end;
end;

constructor TExtendedComparer.Create(const AIgnoreSign: Boolean = False; const AInaccuracy: Extended = 0);
begin
  inherited Create;
  IgnoreSign := AIgnoreSign;
  Inaccuracy := FInaccuracy;
end;

function TExtendedComparer.Equal(const AFirst, ASecond: Extended): Boolean;
begin
  if IgnoreSign then
  begin
    Result := SameValue(Abs(AFirst), Abs(ASecond), Inaccuracy);
  end else
  begin
    Result := SameValue(AFirst, ASecond, Inaccuracy);
  end;
end;

{ TCharComparer }

function TCharComparer.Compare(const AFirst, ASecond: Char): TValueRelationship;
begin
  if IgnoreCase then
  begin
    Result := CompareValue(Ord(UpCase(AFirst)), Ord(UpCase(ASecond)));
  end else
  begin
    Result := CompareValue(Ord(AFirst), Ord(ASecond));
  end;
end;

constructor TCharComparer.Create(const AIgnoreCase: Boolean);
begin
  inherited Create;
  IgnoreCase := AIgnoreCase;
end;

{ TStringComparer }

function TStringComparer.Compare(const AFirst,
  ASecond: String): TValueRelationship;
begin
  if IgnoreCase then
  begin
    Result := String.CompareText(AFirst, ASecond);
  end else
  begin
    Result := String.Compare(AFirst, ASecond);
  end;
end;

constructor TStringComparer.Create(const AIgnoreCase: Boolean = False);
begin
  inherited Create;
  IgnoreCase := AIgnoreCase;
end;

{ TAnsiStringComparer }

function TAnsiStringComparer.Compare(const AFirst,
  ASecond: String): TValueRelationship;
begin
  if IgnoreCase then
  begin
    Result := AnsiCompareText(AFirst, ASecond);
  end else
  begin
    Result := AnsiCompareStr(AFirst, ASecond);
  end;
end;

constructor TAnsiStringComparer.Create(const AIgnoreCase: Boolean);
begin
  inherited Create;
  IgnoreCase := AIgnoreCase;
end;

{ TPointerComparer }

function TPointerComparer.Compare(const AFirst,
  ASecond: Pointer): TValueRelationship;
begin
  Result := CompareValue(NativeInt(AFirst), NativeInt(ASecond));
end;

{ TArrayComparer<T> }

function TArrayComparer<T>.Compare(const AFirst,
  ASecond: TArray<T>): TValueRelationship;
begin
  // Muss noch erweitert werden!
  Result := CompareValue(Length(AFirst), Length(ASecond));
end;

{ TRecordComparer<T> }

function TRecordComparer<T>.Compare(const AFirst,
  ASecond: T): TValueRelationship;
begin
  CompareValue(NativeInt(Addr(AFirst)), NativeInt(Addr(ASecond)));
end;

function TRecordComparer<T>.Equal(const AFirst, ASecond: T): Boolean;
begin
  Result := CompareMem(Addr(AFirst), Addr(ASecond), SizeOf(T));
end;

{ TObjectComparer<T> }

function TObjectComparer<T>.Compare(const AFirst,
  ASecond: T): TValueRelationship;
begin
  Result := CompareValue(AFirst.GetHashCode, ASecond.GetHashCode)
end;

function TObjectComparer<T>.Equal(const AFirst, ASecond: T): Boolean;
begin
  Result := AFirst.Equals(ASecond);
end;

initialization
  TIntegerComparer.RegisterAsDefault;
  TExtendedComparer.RegisterAsDefault;
  TCharComparer.RegisterAsDefault;
  TStringComparer.RegisterAsDefault;
  TPointerComparer.RegisterAsDefault;
  TArrayComparer<TNil>.RegisterAsDefault;
  TRecordComparer<TNil>.RegisterAsDefault;
  TObjectComparer<TObject>.RegisterAsDefault;

end.
