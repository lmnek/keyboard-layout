gui_indicator := Gui()
gui_indicator.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_indicator.BackColor := 0x004040
gui_indicator.Show("x0 y1032 w21 h48 NA") ; NA so that it doesn't draw focus

; hide mode indicator
^PrintScreen::gui_indicator.Hide()
; show mode indicator
+PrintScreen::gui_indicator.Show("NA")


UpdateGuiModeIndicator() {
	gui_indicator.BackColor := navMode ? "green" : 0x004040
	gui_indicator.Show("x0 y1032 w21 h48 NA")
}
