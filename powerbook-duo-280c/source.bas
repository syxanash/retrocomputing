kernal.Open:
Sub Open()
  hostConnected = false
  
  leftSpriteIndex = 1
  leftSpriteDirection = true
  endLeftAnimation = false
  
  rightSpriteIndex = 1
  rightSpriteDirection = true
  
  finalSpriteIndex = 1
  finalSpriteDirection = true
  
  networkDataWindow.show
  'pacmanWindow.show
End Sub

networkDataWindow.saveNetworkButton.Action:
Sub Action()
  dim portValue as Integer
  
  if portInputField.text <> "" and ipInputField.text <> "" then
    portValue = Val(portInputField.text)
    
    If portValue >= 1 and portValue <= 65535 Then
      proxyIp = ipInputField.text
      proxyPort = portValue
      
      self.close
      panelWindow.show
    else
      alertwindow.alertLabel.text = "PORT IS NOT A NUMBER!"
      alertWindow.show
    end
  else
    alertwindow.alertLabel.text = "INPUT CANNOT BE LEFT EMPTY!"
    alertWindow.show
  end
End Sub

Globals.initiateRequest:
Sub initiateRequest(socket as Socket)
  socket.write(postParam)
  socket.write(chr(10))
  
  'Socket.Write("POST / HTTP/1.1" + Chr(13) + Chr(10))
  'Socket.Write("Host: hacktheplanet.simone.computer" + Chr(13) + Chr(10))
  'Socket.Write("Content-Type: application/x-www-form-urlencoded" + Chr(13) + Chr(10))
  'Socket.Write("Content-Length: 11" + Chr(13) + Chr(10))
  'Socket.Write("answer=rest")
  'Socket.Write("Connection: close" + Chr(13) + Chr(10))
  'Socket.Write(Chr(13) + Chr(10))
  
End Sub

alertWindow.PushButton1.Action:
Sub Action()
  if quitOnClose then
    quit
  end
  self.close
End Sub

panelWindow.Open:
Sub Open()
  Socket1.Port = proxyPort
  Socket1.Address = proxyIp
  
  Socket1.connect
  
  rightSmileFPSLabel.text = str(rightSmileBiteTimer.period)
  
  countDownLabel.text = str(socketCallTimer.period)
  
  labelLaunchingVirus.visible = false
  bgLabelLaunchingVirus.visible = false
  
  leftSmileSprite = leftsmileSpritesurface.newSprite(leftcombined, 118, 118)
  rightSmileSprite = rightsmileSpritesurface.newSprite(rightcombined, 118, 118)
End Sub

panelWindow.PushButton1.Action:
Sub Action()
  if rightSmileBiteTimer.mode = 2 then
    return
  end
  
  if hostConnected then
    if rightSpriteIndex < 5 then
      rightSmileEntranceTimer.mode = 2
      endLeftAnimation = true
    end
  else
    alertwindow.alertLabel.text = "HOST NOT CONNECTED!"
    alertWindow.show
  end
End Sub

panelWindow.PushButton2.Action:
Sub Action()
  pushButton1.push
End Sub

panelWindow.PushButton3.Action:
Sub Action()
  pushButton1.push
End Sub

panelWindow.LittleArrows1.Up:
Sub Up()
  socketCallTimer.period = socketCallTimer.period + 50
  countdownLabel.text = str(socketCallTimer.period)
End Sub

panelWindow.LittleArrows1.Down:
Sub Down()
  if socketCallTimer.period > 50 then
    socketCallTimer.period = socketCallTimer.period - 50
    countdownLabel.text = str(socketCallTimer.period)
  end
End Sub

panelWindow.LittleArrows3.Up:
Sub Up()
  rightSmileBiteTimer.period = rightSmileBiteTimer.period + 10
  rightSmileFPSLabel.text = str(rightSmileBiteTimer.period)
End Sub

panelWindow.LittleArrows3.Down:
Sub Down()
  rightSmileBiteTimer.period = rightSmileBiteTimer.period - 10
  rightSmileFPSLabel.text = str(rightSmileBiteTimer.period)
End Sub

panelWindow.Socket1.Error:
Sub Error()
  'dim errorCode as integer
  'errorCode  = Socket1.lastErrorCode
  
  'alertWindow.alertLabel.text = "Error " + str(errorCode)
  'alertWindow.show
End Sub

panelWindow.Socket1.DataAvailable:
Sub DataAvailable()
  dim netoutput as string
  Dim lastChar As String
  
  netoutput = Socket1.ReadAll
  
  lastChar = Right(netoutput, 1)
  
  // if It's a control character remove it
  If Asc(lastChar) < 32 Or Asc(lastChar) = 127 Then
    netoutput = Left(netoutput, Len(netoutput) - 1)
  End If
  
  if netoutput = "HACK THE PLANET!!!" then
    panelWindow.close
    pacmanWindow.show
  else
    alertWindow.alertLabel.text = netoutput
    alertWindow.show
  end
End Sub

panelWindow.Socket1.Connected:
Sub Connected()
  hostConnected = true
  
  alertwindow.alertLabel.text = "CONNECTED!"
  alertWindow.show
  
  leftSmileTimer.mode = 2
  oval1.fillColor = RGB(255,0,0)
End Sub

panelWindow.leftSmileTimer.Action:
Sub Action()
  if leftSpriteDirection then
    leftSmilespritesurface.scroll 118, 0
    leftSpriteIndex = leftSpriteIndex + 1
  else
    leftSmilespritesurface.scroll -118, 0
    leftSpriteIndex = leftSpriteIndex - 1
  end
  
  if leftSpriteIndex = 5 then
    leftSpriteDirection = false
  end
  
  if leftSpriteIndex = 1 then
    leftSpriteDirection = true
  end
  
  if leftSpriteIndex = 1 and endLeftAnimation then
    leftSmileTimer.mode = 0
  end
End Sub

panelWindow.rightSmileEntranceTimer.Action:
Sub Action()
  rightSpriteIndex = rightSpriteIndex + 1
  
  if rightSpriteIndex = 6 then
    rightSmileEntranceTimer.mode = 0
    rightSmileBiteTimer.mode = 2
    socketCallTimer.mode = 1
    
    biteSprite = rightSmileSpriteSurface.newSprite(bitecombined, 118, 118)
    rightSmileSpriteSurface.backdrop = bitecombined
  end
  
  rightSmileSpritesurface.scroll 118, 0
End Sub

panelWindow.rightSmileBiteTimer.Action:
Sub Action()
  if finalSpriteDirection then
    finalSpriteIndex = finalSpriteIndex + 1
  else
    finalSpriteIndex = finalSpriteIndex - 1
  end
  
  if finalSpriteIndex = 2 then
    bgLabelLaunchingVirus.visible = false
    labelLaunchingVirus.visible = false
    finalSpriteDirection = false
    
    rightSmileSpriteSurface.scroll 118, 0
    
    pushbutton1.push
  end
  
  if finalSpriteIndex = 1 then
    bgLabelLaunchingVirus.visible = true
    labelLaunchingVirus.visible = true
    finalSpriteDirection = true
    
    rightSmileSpriteSurface.scroll -118, 0
    
    pushbutton1.push
  end
End Sub

panelWindow.socketCallTimer.Action:
Sub Action()
  initiateRequest(Socket1)
End Sub

pacmanWindow.drawPacman:
Sub drawPacman()
  if pacmanDirection then
    pacmanIndex = pacmanIndex + 1
  else
    pacmanIndex = pacmanIndex - 1
  end
  
  if pacmanIndex = 2 then
    pacmanDirection = false
  end
  
  if pacmanIndex = 1 then
    pacmanDirection = true
  end
  
  pacmanCanvas.backdrop = pacmanSprites(pacmanIndex)
End Sub

pacmanWindow.movePacman:
Sub movePacman()
  pacmanCanvas.left = pacmanCanvas.left + pacmanMovingStep
  
  if pacmanCanvas.left > pacmanWindow.width then
    alertWindow.alertLabel.text = "HACK THE PLANET!!!"
    alertwindow.quitOnClose = true
    alertWindow.show
  end
End Sub

pacmanWindow.Open:
Sub Open()
  pacmanMovingStep = 30
  
  pacmanCanvas.top = (480 - pacmanCanvas.height) / 2
  pacmanCanvas.left = -118
  
  pacmanIndex = 1
  pacmanDirection = true
  
  pacmanSprites(1) = bite1
  pacmanSprites(2) = bite2
End Sub

pacmanWindow.biteTimer.Action:
Sub Action()
  drawPacman()
  movePacman()
End Sub

