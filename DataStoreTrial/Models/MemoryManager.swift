//
//  MemoryManager.swift
//  DataStoreTrial
//
//  Created by tayutaedomo on 2019/08/30.
//  Copyright © 2019 tayutaedomo.net. All rights reserved.
//

//
// Refer: https://medium.com/better-programming/15-quick-tips-to-improve-your-swift-code-ed390c99afcd
//

import Foundation


// - represents a single Task
struct TaskItem: Codable {
    var isToggledOn: Bool
    var title: String
    var notes: String
}


// - handles on-device memory retrieval and storage
class MemoryManager {

    static var tasks: [TaskItem]!                // - static array of TaskItems that currently exists on the device
    private let defaults = UserDefaults.standard // - reference to application's UserDefaults dictionary
    private let DEFAULTS_KEY = "TASK_LIST"       // - the key we use to retrieve/save our array of TaskItems

    init() {
        MemoryManager.tasks = [TaskItem]()
        retrieveData()
        saveData()
    }

    // - decode our array from memory
    private func retrieveData() {
        // - check if an array of TaskItems already exists in memory
        var didFail = false
        if let data = UserDefaults.standard.value(forKey: DEFAULTS_KEY) as? Data {
            if let tasks = try? PropertyListDecoder().decode(Array<TaskItem>.self, from: data) {
                MemoryManager.tasks = tasks
            } else { didFail = true }
        } else { didFail = true }

        // - guard statement: if we had a failure then continue
        guard didFail else { return }

        // - we had a failure in finding a pre-existing array, create a new array of TaskItems!
        MemoryManager.tasks = [
            TaskItem(isToggledOn: false, title: "task 1", notes: "this is task 1"),
            TaskItem(isToggledOn: false, title: "task 2", notes: "this is task 2"),
            TaskItem(isToggledOn: true, title: "task 3", notes: "this is task 3"),
            TaskItem(isToggledOn: false, title: "task 4", notes: "this is task 4"),
            TaskItem(isToggledOn: false, title: "task 5", notes: "this is task 5"),
            TaskItem(isToggledOn: true, title: "task 6", notes: "this is task 6")
        ]
    }

    // - encode our array into memory
    private func saveData() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(MemoryManager.tasks), forKey: DEFAULTS_KEY)
    }

}
