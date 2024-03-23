//
//  EditView.swift
//  HotProspects
//
//  Created by sky on 2024/3/23.
//

import SwiftUI

struct EditView: View {
    @State var prospect: Prospect
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("email address", text: $prospect.emailAddress)
        }
    }
}

#Preview {
    EditView(prospect: Prospect(name: "zhangsan", emailAddress: "zhangsan@123.com", isContacted: false))
}
