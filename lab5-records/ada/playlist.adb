with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure PlayList is

    type Person is record
        name : Unbounded_String;
    end record;

    procedure Put_Person (p : Person) is
    begin
        Put (To_String (p.name));
    end Put_Person;

    type Item_Kind is (PIECE, PAUSE);

    type Item (item_variant : Item_Kind) is record
        length_secs : Float;
        case item_variant is
            when PIECE =>
                name      : Unbounded_String;
                performer : Person;
            when PAUSE =>
                null;
        end case;
    end record;

    procedure Put_Item (i : Item) is
    begin
        -- Check which type of item it is before trying to print specific fields
        case i.item_variant is
            when PIECE =>
                Put (To_String (i.name));
                Put (" by ");
                Put_Person (i.performer);
            when PAUSE =>
                Put ("Pause");
        end case;
        
        -- Both pieces and pauses print their length at the end, 
        -- so this stays outside the case statement!
        Put (" (");
        Put (i.length_secs, aft => 1, exp => 0);
        Put ("s)");
    end Put_Item;

    piece1 : Item :=
       (name => To_Unbounded_String ("Moonlight Sonata"),
        performer => (name => To_Unbounded_String ("Claudio Arrau")),
        length_secs => 17.0*60.0+26.0
       );

     pause1 : Item :=
        (
         item_variant => PAUSE,
         length_secs => 5.0
        );

begin
    Put_Item (piece1);
    Put_Line ("");
     Put_Item(pause1);
     Put_Line ("");
end PlayList;
