//
//  Errors.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-17.
//

import Foundation

enum ChannelError: Error {
    case channelTimeout
    case channelError
}

func channelError() throws -> Void {
    throw ChannelError.channelError
}

func channelTimeout() throws -> Void {
    throw ChannelError.channelTimeout
}
