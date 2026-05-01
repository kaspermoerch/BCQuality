local procedure Initialize()
begin
    if this.Initialized then
        exit;

    this.LibraryInventory.CreateItem(this.GlobalItem);
    this.LibraryPurchase.CreateVendor(this.GlobalVendor);

    Commit();

    this.Initialized := true;
end;
