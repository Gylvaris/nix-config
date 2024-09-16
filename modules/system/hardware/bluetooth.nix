{
  # Why i even have this?
  hardware.bluetooth = {
    enable = true;
    input.General.ClassicBondedOnly = true;
  };

  services.blueman.enable = true;
}
