Add-Type -AssemblyName System.Drawing
foreach ($size in 180, 192, 512) {
  $bitmap = [System.Drawing.Bitmap]::new($size, $size)
  $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
  $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $graphics.ScaleTransform($size / 512.0, $size / 512.0)
  $graphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#111421'))
  $purple = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#aa91ec'))
  $light = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#e2daff'))
  $dark = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#241439'))
  $graphics.FillRectangle($purple, 102, 80, 230, 288)
  $graphics.FillRectangle($light, 162, 137, 245, 295)
  $graphics.FillEllipse($dark, 252, 178, 64, 64)
  $graphics.FillEllipse($dark, 222, 252, 124, 72)
  $graphics.FillRectangle($dark, 216, 351, 140, 13)
  $graphics.FillRectangle($dark, 216, 381, 105, 13)
  $bitmap.Save((Join-Path $PSScriptRoot "app-icon-$size.png"), [System.Drawing.Imaging.ImageFormat]::Png)
  $dark.Dispose(); $light.Dispose(); $purple.Dispose(); $graphics.Dispose(); $bitmap.Dispose()
}
