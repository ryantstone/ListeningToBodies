import UIKit

class PrefaceTableView: UITableView {

    var data = [Block]()

    public func configure(_ data: [Block]) {
        self.data   = data
        dataSource  = self
        delegate    = self
        register(TextCell.self, forCellReuseIdentifier: String(describing: TextCell.self))
        rowHeight = UITableView.automaticDimension
    }
}

// MARK: - Delegate
extension PrefaceTableView: UITableViewDelegate {

}

// MARK: - Data Source
extension PrefaceTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? TextCell else {
            return TextCell(frame: .zero)
        }
        return cell.configure(data[indexPath.row])
    }
}

class TextCell: UITableViewCell {

    let textView: UITextView = {
        $0.isScrollEnabled = false
        return $0
    }(UITextView(frame: .zero))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(textView)
    }

    private func setConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.rightAnchor.constraint(equalTo: rightAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }

    public func configure(_ data: Block) -> Self {
        guard let textData = data as? TextBlock else {
            fatalError("Incorrect block type")
        }
        textView.text = textData.textSection
        return self
    }
}
