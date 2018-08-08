import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dado1: UIImageView!
    @IBOutlet weak var dado2: UIImageView!
    
    var randomDadoUno: Int = 0
    var randomDadoDos: Int = 0
    let listaDados = ["1", "2", "3", "4", "5", "6"]
    let nCaras: UInt32
    
    required init?(coder aDecoder: NSCoder) {
        nCaras = UInt32(listaDados.count)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func generarNumero() {
        randomDadoUno = Int(arc4random_uniform(nCaras))
        randomDadoDos = Int(arc4random_uniform(nCaras))
        
        // Animaciones
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.dado1.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            self.dado2.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            self.dado1.alpha = 0.0
            self.dado2.alpha = 0.0
        }) { (completed) in
            self.dado1.transform = CGAffineTransform.identity
            self.dado2.transform = CGAffineTransform.identity
            self.dado1.alpha = 1.0
            self.dado2.alpha = 1.0
            self.dado1.image = UIImage(named: self.listaDados[self.randomDadoUno])
            self.dado2.image = UIImage(named: self.listaDados[self.randomDadoDos])
        }
    }

    @IBAction func tirarDados(_ sender: UIButton) {
        generarNumero()
    }
    
    // Eventos de agitar el telefono
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generarNumero()
        }
    }
}

