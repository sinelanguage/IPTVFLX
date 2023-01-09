//
//  Bootstrap.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2023-01-06.
//

import Foundation

func addProviders() -> Void {
    print(ADD_PROVIDERS)
}

func showProviders() -> Void {
    print(SHOW_PROVIDERS)
}

// After launch screen dismisses
func getProviders<T>(providers: Array<T> = []) -> Void {
    if providers.isEmpty {
        addProviders()
        return
    }
    showProviders()
    return
}

