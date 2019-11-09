unit Collections.Core;

interface

type
  TSortingRoutine = (srQuick, srShell, srBubble);

  IEnumerator<T> = interface
    ['{A4006EC3-1338-42A0-84AF-250D9EFE1ADD}']
    function GetCurrent: T;
    property Current: T read GetCurrent;
    function MoveNext: Boolean;
    procedure Reset;
  end;

  ICollection<T> = interface
    ['{DFF2C073-ECD3-4948-AC49-669A9FA50DE5}']
    function GetEnumerator: IEnumerator<T>;
  end;

implementation

end.
