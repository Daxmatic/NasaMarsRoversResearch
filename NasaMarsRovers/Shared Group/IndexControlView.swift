////
////  IndexControlView.swift
////  NasaMarsRovers
////
////  Created by Dax Hoes on 05/10/2021.
////
//
//import Combine
//import SwiftUI
//
//class IndexViewModel:ObservableObject {
//
//    var cancellationToken: AnyCancellable? // 2
//    var currentIndex : String = "0" {
//        didSet {
//            print("This is our current Index: \( currentIndex   )")
//        }
//    }
//    init() {
//        getIndex() // 3
//    }
//
//}
//
//extension IndexViewModel {
//
//    // Subscriber implementation
//    func getIndex() {
//        let indexBla = IndexViewModel()
//        let lvlRange = "5"
//        let _ = lvlRange
//            .publisher
//            .assign(to: currentIndex  , on: indexBla)
//    }
//
//}
//
//
//
//struct ImageStore: Identifiable {
//    let name: String
//    let id: Int
//}
//
//struct IndexControlView: View {
//    let imageNames = [
//        ImageStore(name: "a.circle.fill", id: 0),
//        ImageStore(name: "b.circle.fill", id: 1),
//        ImageStore(name: "c.circle.fill", id: 2),
//        ImageStore(name: "d.circle.fill", id: 3),
//        ImageStore(name: "e.circle.fill", id: 4),
//        ImageStore(name: "f.circle.fill", id: 5),
//        ImageStore(name: "g.circle.fill", id: 6),
//        ImageStore(name: "h.circle.fill", id: 7),
//        ImageStore(name: "i.circle.fill", id: 8),
//        ImageStore(name: "j.circle.fill", id: 9),
//        ImageStore(name: "k.circle.fill", id: 10),
//        ImageStore(name: "l.circle.fill", id: 11),
//        ImageStore(name: "m.circle.fill", id: 12),
//        ImageStore(name: "n.circle.fill", id: 13),
//        ImageStore(name: "o.circle.fill", id: 14),
//        ImageStore(name: "p.circle.fill", id: 15),
//        ImageStore(name: "q.circle.fill", id: 16),
//    ]
//    @State private var messageId: AnyCancellable?
//
//    var body: some View {
//        HStack(alignment: .center) {
//            Button(action: {
//                withAnimation {
//                    if var currentIndex1:  = 0 {
//                        pass()
//                    }
//
////                    currentIndex = 0
////                    scrollView.scrollTo(0)
////                    currentIndex = 0
//                }
//            }) {
//                Image(systemName: "arrow.uturn.left.circle.fill")
//                    .renderingMode(.original)
//                    .symbolRenderingMode(.hierarchical)
//                    .font(.system(size: 18))
//                    .foregroundColor(.green)
//            }
//            .padding(.leading)
//            Button(action: {
//                withAnimation {
////                    currentIndex -= 8
////                    scrollView.scrollTo(currentIndex, anchor: .top)
//                }
//            }) {
//                Image(systemName: "arrow.backward.circle.fill")
//                    .renderingMode(.original)
//                    .symbolRenderingMode(.hierarchical)
//                    .font(.system(size: 18))
//                    .foregroundColor(.green)
//            }
//            .padding(24)
//
//            Button(action: {
//                withAnimation {
////                    currentIndex += 8
////                    scrollView.scrollTo(currentIndex, anchor: .top)
//                }
//            }) {
//                Image(systemName: "arrow.forward.circle.fill")
//                    .renderingMode(.original)
//                    .symbolRenderingMode(.hierarchical)
//                    .font(.system(size: 18))
//                    .foregroundColor(.green)
//            }
//            .padding(24)
//
//            Button(action: {
//                withAnimation {
////                    currentIndex = vm.camerasOnSol.count
////                    scrollView.scrollTo(currentIndex)
//                }
//            }) {
//                Image(systemName: "arrow.uturn.right.circle.fill")
//                    .renderingMode(.original)
//                    .symbolRenderingMode(.hierarchical)
//                    .font(.system(size: 18))
//                    .foregroundColor(.green)
//            }
//            .padding(.trailing)
//        }
//    }
//    func pass() {
//        IndexViewModel().getIndex()
//    }
//}
//
//struct IndexControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndexControlView()
//    }
//}
//
//
