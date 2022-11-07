//
//  ContentView.swift
//  SwiftUI_Navigation
//
//  Created by Bill Seaman on 4/15/22.
//

import SwiftUI

struct ContentView: View {
  @State var isActive : Bool = false

  var body: some View {
    NavigationView {
      NavigationLink(
        destination: ContentView2(rootIsActive: self.$isActive),
        isActive: self.$isActive
      ) {
        Text("Push view #2")
      }
      .isDetailLink(false)
      .navigationBarTitle("Root view")
    }
  }
}

struct ContentView2: View {
  @Binding var rootIsActive: Bool
  @State private var isActive: Bool = false

  var body: some View {
    NavigationLink(
      destination: ContentView3(rootIsActive: self.$rootIsActive,
                                view2IsActive: $isActive),
      isActive: self.$isActive) {
        Text("Push view #3!")
    }
    .isDetailLink(false)
    .navigationBarTitle("View #2")
  }
}

struct ContentView3: View {
  @Binding var rootIsActive : Bool
  @Binding var view2IsActive : Bool
  @State private var isActive: Bool = false

  var body: some View {
    NavigationLink(
      destination: ContentView4(rootIsActive: $rootIsActive,
                                view2IsActive: $view2IsActive,
                                view3IsActive: $isActive),
      isActive: self.$isActive) {
        Text("Push view #4!")
    }
    .isDetailLink(false)
    .navigationBarTitle("View #3")
  }
}

struct ContentView4: View {
  @Binding var rootIsActive : Bool
  @Binding var view2IsActive : Bool
  @Binding var view3IsActive : Bool

  var body: some View {
    VStack {
      Text("Last view!")
      Button (action: { rootIsActive = false } ){
        Text("Pop to Root view")
      }
      Button (action: { view2IsActive = false } ){
        Text("Pop to View #2")
      }
    }.navigationBarTitle("View #4")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
