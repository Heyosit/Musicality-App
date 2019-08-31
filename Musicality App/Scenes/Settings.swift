
import SpriteKit

class SettingsScreen: BaseScreen {
    var isAlreadyInVibration = false
    let soundManager = SoundManager()
    
    override init() {
        super.init()
    }
    
    override func createSceneContents() {
        super.createSceneContents()
        
        let testLabel = SKLabelNode(text: Consts.Texts.testSounds)
        testLabel.fontSize = 70
        testLabel.position = Positions.testSoundsLabel
        testLabel.fontName = "Noteworthy-Bold"
        testLabel.fontColor = UIColor.blue
        testLabel.numberOfLines = 3
        testLabel.preferredMaxLayoutWidth = Consts.Graphics.screenWidth - (Consts.Graphics.spacingWidth * 2)
        testLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        addChild(testLabel)
        
        //gesture nodes
        for index in 0...Consts.Names.NodesNames.gestureImages.count - 1{
            let gestureImage = SKSpriteNode(imageNamed: Consts.Names.NodesNames.gestureImages[index])
            gestureImage.position = Positions.columsInSettings[index]
            gestureImage.name = "gesture \(index)" 
            gestureImage.size = Consts.Sizes.littleSquareButton
            
            self.addChild(gestureImage)
        }
        if gameManager.difficulty == .normal {
            self.childNode(withName: "gesture 2")?.isHidden = true
        }
        
        //bass
        var buttonData = ButtonData(texture: Instruments.bass.rawValue, name: Instruments.bass.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[0].x, y: Consts.Positions.rowGestures[1]), zPosition: Z.buttons)
        
        let bassNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        bassNode.delegate = self
        bassNode.setup(buttonData: buttonData)
        bassNode.hasActiveState = true
        bassNode.buttonIsActive()

        var labelData = LabelData(name: Instruments.bass.rawValue, text: Instruments.bass.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        var accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.bass.rawValue + " " + Consts.Texts.tap)
        accessibilityLabel.alpha = 0.01
        accessibilityLabel.zPosition = Z.accLabels

        bassNode.addChild(accessibilityLabel)
        
        self.addChild(bassNode)
        
        //drum
        buttonData = ButtonData(texture: Instruments.drum.rawValue, name: Instruments.drum.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[0].x, y: Consts.Positions.rowGestures[2]), zPosition: Z.buttons)
        
        let drumNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        drumNode.delegate = self
        drumNode.setup(buttonData: buttonData)
        drumNode.hasActiveState = true
        labelData = LabelData(name: Instruments.drum.rawValue, text: Instruments.drum.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.drum.rawValue + " " + Consts.Texts.tap)
        accessibilityLabel.alpha = 0.01
        accessibilityLabel.zPosition = Z.accLabels

        drumNode.addChild(accessibilityLabel)
        
        self.addChild(drumNode)
        
        //violin
        buttonData = ButtonData(texture: Instruments.violin.rawValue, name: Instruments.violin.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[1].x, y: Consts.Positions.rowGestures[1]), zPosition: Z.buttons)
        
        let violinNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        violinNode.delegate = self
        violinNode.setup(buttonData: buttonData)
        violinNode.hasActiveState = true
        violinNode.buttonIsActive()

        labelData = LabelData(name: Instruments.violin.rawValue, text: Instruments.violin.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.violin.rawValue + " " + Consts.Texts.swipeHor)
        accessibilityLabel.alpha = 0.01
        accessibilityLabel.zPosition = Z.accLabels

        violinNode.addChild(accessibilityLabel)
        
        self.addChild(violinNode)
        
        //piano
        buttonData = ButtonData(texture: Instruments.piano.rawValue, name: Instruments.piano.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[1].x, y: Consts.Positions.rowGestures[2]), zPosition: Z.buttons)
        
        let pianoNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        pianoNode.delegate = self
        pianoNode.setup(buttonData: buttonData)
        pianoNode.hasActiveState = true
        labelData = LabelData(name: Instruments.piano.rawValue, text: Instruments.piano.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.piano.rawValue + " " + Consts.Texts.swipeHor)
        accessibilityLabel.alpha = 0.01
        accessibilityLabel.zPosition = Z.accLabels

        pianoNode.addChild(accessibilityLabel)
        
        self.addChild(pianoNode)
        
        //clarinet
        buttonData = ButtonData(texture: Instruments.clarinet.rawValue, name: Instruments.clarinet.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[2].x, y: Consts.Positions.rowGestures[1]), zPosition: Z.buttons)
        
        let clarinetNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        clarinetNode.delegate = self
        clarinetNode.setup(buttonData: buttonData)
        clarinetNode.isHidden = true

        if gameManager.difficulty == .hard {
            clarinetNode.hasActiveState = true
            clarinetNode.buttonIsActive()
            
            clarinetNode.isHidden = false

        }
        labelData = LabelData(name: Instruments.clarinet.rawValue, text: Instruments.clarinet.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.clarinet.rawValue + " " + Consts.Texts.swipeVer)
        accessibilityLabel.zPosition = Z.accLabels

        accessibilityLabel.alpha = 0.01
        clarinetNode.addChild(accessibilityLabel)
        
        self.addChild(clarinetNode)
        
        //frenchHorn
        buttonData = ButtonData(texture: Instruments.frenchHorn.rawValue, name: Instruments.frenchHorn.rawValue, size: Consts.Sizes.littleSquareButton, position: CGPoint(x: Positions.columsInSettings[2].x, y: Consts.Positions.rowGestures[2]), zPosition: Z.buttons)
        
        let frenchHornNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        frenchHornNode.delegate = self
        frenchHornNode.setup(buttonData: buttonData)
        frenchHornNode.isHidden = true

        if gameManager.difficulty == .hard {
            frenchHornNode.hasActiveState = true
//            frenchHornNode.buttonIsActive()
            frenchHornNode.isHidden = false

        }

        labelData = LabelData(name: Instruments.frenchHorn.rawValue, text: Instruments.frenchHorn.rawValue, position: nil, zPosition: Z.accLabels, fontSize: 80, fontColor: UIColor.black)
        accessibilityLabel = SKLabelCustom(name: labelData.name)
        accessibilityLabel.setup(labelData: labelData)
        accessibilityLabel.setText(text: Instruments.frenchHorn.rawValue + " " + Consts.Texts.swipeVer)
        accessibilityLabel.alpha = 0.01
        frenchHornNode.addChild(accessibilityLabel)
        
        self.addChild(frenchHornNode)
        
    }
    
    
    override func buttonNodeTapped(_ sender: ButtonNode) {
        super.buttonNodeTapped(sender)
        guard let name = sender.name else { return }
        guard let scene = self.scene else {return}
            switch name {
            case Instruments.bass.rawValue:
                soundManager.playSound(instrument: Instruments.bass.rawValue, scene: scene)
                sounds[0] = Instruments.bass.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.drum.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()
                break
            case Instruments.drum.rawValue:
                isAlreadyInVibration = true
                soundManager.playSound(instrument: Instruments.drum.rawValue, scene: scene)
                sounds[0] = Instruments.drum.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.bass.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()
                break
            case Instruments.violin.rawValue:
                isAlreadyInVibration = true
                soundManager.playSound(instrument: Instruments.violin.rawValue, scene: scene)
                sounds[1] = Instruments.violin.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.piano.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()
                break
            case Instruments.piano.rawValue:
                isAlreadyInVibration = true
                soundManager.playSound(instrument: Instruments.piano.rawValue, scene: scene)
                sounds[1] = Instruments.piano.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.violin.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()
                break
            case Instruments.clarinet.rawValue:
                isAlreadyInVibration = true
                soundManager.playSound(instrument: Instruments.clarinet.rawValue, scene: scene)
                sounds[2] = Instruments.clarinet.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.frenchHorn.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()

                break
            case Instruments.frenchHorn.rawValue:
                isAlreadyInVibration = true
                soundManager.playSound(instrument: Instruments.frenchHorn.rawValue, scene: scene)
                sounds[2] = Instruments.frenchHorn.rawValue
                sender.buttonIsActive()
                guard let notActiveButton = self.childNode(withName: Instruments.clarinet.rawValue) as! ButtonNode? else {return}
                notActiveButton.buttonIsNotActive()
                break
            default:
                print("nothing")
                break
            }
        
    }
    
    
    func createAndShowGestureButtonsAndLabels(index: Int, buttonPosition: CGPoint) {
        let labelData = LabelData(name: Consts.Names.LabelNames.hapticLabelsInSettings[index] , text: Consts.Texts.hapticGesturesInSettings[index], position: nil, zPosition: Z.labels, fontSize: 20, fontColor: nil)
        let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.hapticButtonsInSettings[0], name: Consts.Names.NodesNames.hapticButtonsInSettings[index], size: Consts.Sizes.littleSquareButton, position: buttonPosition, zPosition: Z.buttons)
        createButtonAndLabel(buttonData: buttonData, labelData: labelData)
        guard let button = scene?.childNode(withName: buttonData.name) as! ButtonNode? else {return}
        button.isWithHaptic = false
        guard let label = button.childNode(withName: labelData.name) as! SKLabelCustom? else {return}
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = buttonData.size.width
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
