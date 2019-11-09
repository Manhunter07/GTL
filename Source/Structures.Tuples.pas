unit Structures.Tuples;

interface

type
  TTupleEvent = procedure(Sender: Pointer; AIndex: Integer);

  TTuple<T1, T2> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    constructor Create(const AValue1: T1; const AValue2: T2);
  end;

  TTuple<T1, T2, T3> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3);
  end;

  TTuple<T1, T2, T3, T4> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    FValue4: T4;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
    procedure SetValue4(const AValue: T4);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    property Value4: T4 read FValue4 write SetValue4;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3; const AValue4: T4);
  end;

  TTuple<T1, T2, T3, T4, T5> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    FValue4: T4;
    FValue5: T5;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
    procedure SetValue4(const AValue: T4);
    procedure SetValue5(const AValue: T5);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    property Value4: T4 read FValue4 write SetValue4;
    property Value5: T5 read FValue5 write SetValue5;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5);
  end;

  TTuple<T1, T2, T3, T4, T5, T6> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    FValue4: T4;
    FValue5: T5;
    FValue6: T6;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
    procedure SetValue4(const AValue: T4);
    procedure SetValue5(const AValue: T5);
    procedure SetValue6(const AValue: T6);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    property Value4: T4 read FValue4 write SetValue4;
    property Value5: T5 read FValue5 write SetValue5;
    property Value6: T6 read FValue6 write SetValue6;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5; const AValue6: T6);
  end;

  TTuple<T1, T2, T3, T4, T5, T6, T7> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    FValue4: T4;
    FValue5: T5;
    FValue6: T6;
    FValue7: T7;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
    procedure SetValue4(const AValue: T4);
    procedure SetValue5(const AValue: T5);
    procedure SetValue6(const AValue: T6);
    procedure SetValue7(const AValue: T7);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    property Value4: T4 read FValue4 write SetValue4;
    property Value5: T5 read FValue5 write SetValue5;
    property Value6: T6 read FValue6 write SetValue6;
    property Value7: T7 read FValue7 write SetValue7;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5; const AValue6: T6; const AValue7: T7);
  end;

  TTuple<T1, T2, T3, T4, T5, T6, T7, T8> = record
  private
    FOnChange: TTupleEvent;
    FValue1: T1;
    FValue2: T2;
    FValue3: T3;
    FValue4: T4;
    FValue5: T5;
    FValue6: T6;
    FValue7: T7;
    FValue8: T8;
    procedure SetValue1(const AValue: T1);
    procedure SetValue2(const AValue: T2);
    procedure SetValue3(const AValue: T3);
    procedure SetValue4(const AValue: T4);
    procedure SetValue5(const AValue: T5);
    procedure SetValue6(const AValue: T6);
    procedure SetValue7(const AValue: T7);
    procedure SetValue8(const AValue: T8);
  private
    procedure DoChange(const AIndex: Integer);
  public
    property OnChange: TTupleEvent read FOnChange write FOnChange;
    property Value1: T1 read FValue1 write SetValue1;
    property Value2: T2 read FValue2 write SetValue2;
    property Value3: T3 read FValue3 write SetValue3;
    property Value4: T4 read FValue4 write SetValue4;
    property Value5: T5 read FValue5 write SetValue5;
    property Value6: T6 read FValue6 write SetValue6;
    property Value7: T7 read FValue7 write SetValue7;
    property Value8: T8 read FValue8 write SetValue8;
    constructor Create(const AValue1: T1; const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5; const AValue6: T6; const AValue7: T7; const AValue8: T8);
  end;

implementation

{ TTuple<T1, T2> }

constructor TTuple<T1, T2>.Create(const AValue1: T1; const AValue2: T2);
begin
  Value1 := AValue1;
  Value2 := AValue2;
end;

procedure TTuple<T1, T2>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

{ TTuple<T1, T2, T3> }

constructor TTuple<T1, T2, T3>.Create(const AValue1: T1; const AValue2: T2;
  const AValue3: T3);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
end;

procedure TTuple<T1, T2, T3>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

{ TTuple<T1, T2, T3, T4> }

constructor TTuple<T1, T2, T3, T4>.Create(const AValue1: T1; const AValue2: T2;
  const AValue3: T3; const AValue4: T4);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
  Value4 := AValue4;
end;

procedure TTuple<T1, T2, T3, T4>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3, T4>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3, T4>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3, T4>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

procedure TTuple<T1, T2, T3, T4>.SetValue4(const AValue: T4);
begin
  Value4 := AValue;
  DoChange(4);
end;

{ TTuple<T1, T2, T3, T4, T5> }

constructor TTuple<T1, T2, T3, T4, T5>.Create(const AValue1: T1;
  const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
  Value4 := AValue4;
  Value5 := AValue5;
end;

procedure TTuple<T1, T2, T3, T4, T5>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3, T4, T5>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3, T4, T5>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3, T4, T5>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

procedure TTuple<T1, T2, T3, T4, T5>.SetValue4(const AValue: T4);
begin
  Value4 := AValue;
  DoChange(4);
end;

procedure TTuple<T1, T2, T3, T4, T5>.SetValue5(const AValue: T5);
begin
  Value5 := AValue;
  DoChange(5);
end;

{ TTuple<T1, T2, T3, T4, T5, T6> }

constructor TTuple<T1, T2, T3, T4, T5, T6>.Create(const AValue1: T1;
  const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5;
  const AValue6: T6);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
  Value4 := AValue4;
  Value5 := AValue5;
  Value6 := AValue6;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue4(const AValue: T4);
begin
  Value4 := AValue;
  DoChange(4);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue5(const AValue: T5);
begin
  Value5 := AValue;
  DoChange(5);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6>.SetValue6(const AValue: T6);
begin
  Value6 := AValue;
  DoChange(6);
end;

{ TTuple<T1, T2, T3, T4, T5, T6, T7> }

constructor TTuple<T1, T2, T3, T4, T5, T6, T7>.Create(const AValue1: T1;
  const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5;
  const AValue6: T6; const AValue7: T7);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
  Value4 := AValue4;
  Value5 := AValue5;
  Value6 := AValue6;
  Value7 := AValue7;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.DoChange(const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue4(const AValue: T4);
begin
  Value4 := AValue;
  DoChange(4);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue5(const AValue: T5);
begin
  Value5 := AValue;
  DoChange(5);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue6(const AValue: T6);
begin
  Value6 := AValue;
  DoChange(6);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7>.SetValue7(const AValue: T7);
begin
  Value7 := AValue;
  DoChange(7);
end;

{ TTuple<T1, T2, T3, T4, T5, T6, T7, T8> }

constructor TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.Create(const AValue1: T1;
  const AValue2: T2; const AValue3: T3; const AValue4: T4; const AValue5: T5;
  const AValue6: T6; const AValue7: T7; const AValue8: T8);
begin
  Value1 := AValue1;
  Value2 := AValue2;
  Value3 := AValue3;
  Value4 := AValue4;
  Value5 := AValue5;
  Value6 := AValue6;
  Value7 := AValue7;
  Value8 := AValue8;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.DoChange(
  const AIndex: Integer);
begin
  if Assigned(OnChange) then
  begin
    OnChange(@Self, AIndex);
  end;
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue1(const AValue: T1);
begin
  Value1 := AValue;
  DoChange(1);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue2(const AValue: T2);
begin
  Value2 := AValue;
  DoChange(2);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue3(const AValue: T3);
begin
  Value3 := AValue;
  DoChange(3);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue4(const AValue: T4);
begin
  Value4 := AValue;
  DoChange(4);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue5(const AValue: T5);
begin
  Value5 := AValue;
  DoChange(5);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue6(const AValue: T6);
begin
  Value6 := AValue;
  DoChange(6);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue7(const AValue: T7);
begin
  Value7 := AValue;
  DoChange(7);
end;

procedure TTuple<T1, T2, T3, T4, T5, T6, T7, T8>.SetValue8(const AValue: T8);
begin
  Value8 := AValue;
  DoChange(8);
end;

end.
