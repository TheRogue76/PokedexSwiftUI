//
//  ErrorHandler.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import Foundation

func logError(_ err: Error) -> Void {
    // In the real world, we use something like sentry to handle this, but for this project i am only going to do print
    print(err.localizedDescription)
}
