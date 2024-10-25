import Array "mo:base/Array";
import Debug "mo:base/Debug";

actor Diary {
    var entries: [Text] = [];  // Günlük girişlerini saklayacak dizi

    // Yeni bir günlük girişi eklemek için shared fonksiyon
    public shared func addEntry(entry: Text): async Text {
        entries := Array.append<Text>(entries, [entry]);  
        Debug.print("New entry added: " # entry);
        return "Entry added successfully!";
    };

    // Tüm günlük girişlerini almak için shared fonksiyon
    public shared func getEntries(): async [Text] {
        Debug.print("Retrieving all entries...");
        return entries;
    };

    // En son eklenen girişin alınması için shared fonksiyon
    public shared func getLatestEntry(): async ?Text {
        if (entries.size() > 0) {
            Debug.print("Retrieving the latest entry...");
            return ?entries[entries.size() - 1];
        };
        return null;
    };
};
