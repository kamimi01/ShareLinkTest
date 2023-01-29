//
//  ContentView.swift
//  ShareLinkTest
//
//  Created by mikaurakawa on 2023/01/29.
//

import SwiftUI

struct ContentView: View {
    let photo = Photo(image: Image("people"), caption: "人々のアイコン")

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("1. システム標準の外観（リンクのみ）")
                ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
            }

            VStack(alignment: .leading) {
                Text("2.リンクのタイトルだけをカスタマイズ")
                ShareLink("リンクのタイトル", item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
            }

            VStack(alignment: .leading) {
                Text("3.リンクの外観全体をカスタマイズ")
                ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                    HStack {
                        Image(systemName: "personalhotspot")
                        Text("共有ボタン")
                    }
                    .foregroundColor(.red)
                }
                
            }

            VStack(alignment: .leading) {
                Text("4.Transferableに準拠した独自の型を渡し、プレビューもカスタマイズ")
                ShareLink(
                    item: photo,
                    preview: SharePreview(
                        photo.caption,
                        image: photo.image))
            }

            VStack(alignment: .leading) {
                Text("5.サブジェクトとメッセージを追加")
                ShareLink(
                    item: photo,
                    subject: Text("Cool Photo"),
                    message: Text("Check it out!"),
                    preview: SharePreview(photo.caption, image: Image("people"))
                )

            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct Photo: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }

    public var image: Image
    public var caption: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
