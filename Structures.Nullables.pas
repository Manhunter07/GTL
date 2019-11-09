unit Structures.Nullables;

interface

uses
  System.Types, System.TypInfo,
  Texts.Errors, Comparers.Core, Structures.Core, Comparers.Defaults;

type
  ENullableException = class abstract(EStructureException);
  ENullableException<T> = class(ENullableException);

  TNullable = (Null);

  TNullable<T> = record
  private class var
    FComparer: TComparer<T>;
  private
    FValue: T;
    FNull: Boolean;
    class function GetComparer: TComparer<T>; static;
    procedure SetValue(const Value: T);
  private
    class property Comparer: TComparer<T> read GetComparer;
    property Value: T read FValue write SetValue;
  public
    class constructor Create;
    class destructor Destroy;
    class operator Implicit(const AValue: T): TNullable<T>;
    class operator Implicit(const ANull: TNullable): TNullable<T>;
    class operator Explicit(const AValue: T): TNullable<T>;
    class operator Explicit(const ANull: TNullable): TNullable<T>;
    class operator Equal(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator Equal(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator Equal(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
    class operator NotEqual(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator NotEqual(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator NotEqual(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
    class operator GreaterThan(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator GreaterThan(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator GreaterThan(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
    class operator GreaterThanOrEqual(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator GreaterThanOrEqual(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator GreaterThanOrEqual(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
    class operator LessThan(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator LessThan(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator LessThan(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
    class operator LessThanOrEqual(const ANullable: TNullable<T>; const AValue: T): Boolean;
    class operator LessThanOrEqual(const AFirst, ASecond: TNullable<T>): Boolean;
    class operator LessThanOrEqual(const ANullable: TNullable<T>; const ANull: TNullable): Boolean;
  end;

implementation

{ TNullable<T> }

class constructor TNullable<T>.Create;
begin
  FComparer := TComparer<T>.Default;
end;

class destructor TNullable<T>.Destroy;
begin
  if Assigned(Comparer) then
  begin
    Comparer.Free;
  end;
end;

class operator TNullable<T>.Equal(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  Result := ANullable.FNull;
end;

class operator TNullable<T>.Equal(const AFirst, ASecond: TNullable<T>): Boolean;
begin
  Result := ((AFirst = Null) = (ASecond = Null)) and Comparer.Equal(AFirst.FValue, ASecond.FValue);
end;

class operator TNullable<T>.Equal(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  Result := ANullable = TNullable<T>(AValue);
end;

class operator TNullable<T>.Explicit(const ANull: TNullable): TNullable<T>;
begin
  Result := ANull;
end;

class operator TNullable<T>.Explicit(const AValue: T): TNullable<T>;
begin
  Result := AValue;
end;

class function TNullable<T>.GetComparer: TComparer<T>;
begin
  Result := FComparer;
  if not Assigned(Result) then
  begin
    raise ENullableException<T>.CreateResFmt(@Structures_Nullables_NoComparer, [GetTypeName(TypeInfo(T))]);
  end;
end;

class operator TNullable<T>.GreaterThan(const AFirst,
  ASecond: TNullable<T>): Boolean;
begin
  if (AFirst = Null) or (ASecond = Null) then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := Comparer.Compare(AFirst.FValue, ASecond.FValue) = GreaterThanValue;
end;

class operator TNullable<T>.GreaterThan(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
end;

class operator TNullable<T>.GreaterThan(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  if ANullable = Null then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := Comparer.Compare(ANullable.FValue, AValue) = GreaterThanValue;
end;

class operator TNullable<T>.GreaterThanOrEqual(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  if ANullable = Null then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := (Comparer.Compare(ANullable.FValue, AValue) = GreaterThanValue) or Comparer.Equal(ANullable.FValue, AValue);
end;

class operator TNullable<T>.GreaterThanOrEqual(const AFirst,
  ASecond: TNullable<T>): Boolean;
begin
  if (AFirst = Null) or (ASecond = Null) then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := (Comparer.Compare(AFirst.FValue, ASecond.FValue) = GreaterThanValue) or Comparer.Equal(AFirst.FValue, ASecond.FValue);
end;

class operator TNullable<T>.GreaterThanOrEqual(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
end;

class operator TNullable<T>.Implicit(const ANull: TNullable): TNullable<T>;
begin
  Result.FNull := True;
end;

class operator TNullable<T>.Implicit(const AValue: T): TNullable<T>;
begin
  Result.Value := AValue;
end;

class operator TNullable<T>.LessThan(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
end;

class operator TNullable<T>.LessThan(const AFirst,
  ASecond: TNullable<T>): Boolean;
begin
  if (AFirst = Null) or (ASecond = Null) then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := Comparer.Compare(AFirst.FValue, ASecond.FValue) = LessThanValue;
end;

class operator TNullable<T>.LessThan(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  if ANullable = Null then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := Comparer.Compare(ANullable.FValue, AValue) = LessThanValue;
end;

class operator TNullable<T>.LessThanOrEqual(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
end;

class operator TNullable<T>.LessThanOrEqual(const AFirst,
  ASecond: TNullable<T>): Boolean;
begin
  if (AFirst = Null) or (ASecond = Null) then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := (Comparer.Compare(AFirst.FValue, ASecond.FValue) = LessThanValue) or Comparer.Equal(AFirst.FValue, ASecond.FValue);
end;

class operator TNullable<T>.LessThanOrEqual(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  if ANullable = Null then
  begin
    raise ENullableException<T>.CreateRes(@Structures_Nullables_NoValue);
  end;
  Result := (Comparer.Compare(ANullable.FValue, AValue) = LessThanValue) or Comparer.Equal(ANullable.FValue, AValue);
end;

class operator TNullable<T>.NotEqual(const ANullable: TNullable<T>;
  const ANull: TNullable): Boolean;
begin
  Result := not (ANullable = ANull);
end;

procedure TNullable<T>.SetValue(const Value: T);
begin
  if Self = Null then
  begin
    FNull := False;
  end;
  FValue := Value;
end;

class operator TNullable<T>.NotEqual(const AFirst,
  ASecond: TNullable<T>): Boolean;
begin
  Result := not (AFirst = ASecond);
end;

class operator TNullable<T>.NotEqual(const ANullable: TNullable<T>;
  const AValue: T): Boolean;
begin
  Result := not (ANullable = AValue);
end;

end.
