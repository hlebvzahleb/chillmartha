//
//  MusicRouter.swift
//  FocOn
//
//  Created by Artem Gorshkov on 22.09.21.
//

import UIKit

class MusicRouterImpl: MusicRouter {
    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }
}
