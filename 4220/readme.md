
@IBAction func buttonTapped(_ sender: UIButton) {var alert = UIAlertController(title: "Title",message: "Message", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
