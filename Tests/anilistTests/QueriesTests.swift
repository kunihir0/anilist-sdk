import XCTest
@testable import anilist

// swiftlint:disable explicit_acl explicit_top_level_acl
final class QueriesTests: XCTestCase {
    
    func testMediaDecoding() throws {
        let jsonResponse = """
        {
            "id": 1,
            "title": {
                "romaji": "Cowboy Bebop",
                "english": "Cowboy Bebop"
            },
            "type": "ANIME",
            "format": "TV",
            "status": "FINISHED",
            "episodes": 26,
            "startDate": {
                "year": 1998,
                "month": 4,
                "day": 3
            },
            "genres": ["Action", "Sci-Fi"]
        }
        """
        
        let decoder = JSONDecoder()
        let data = try XCTUnwrap(jsonResponse.data(using: .utf8))
        let media = try decoder.decode(Media.self, from: data)
        
        XCTAssertEqual(media.id, 1)
        XCTAssertEqual(media.title?.romaji, "Cowboy Bebop")
        XCTAssertEqual(media.title?.english, "Cowboy Bebop")
        XCTAssertEqual(media.type, .anime)
        XCTAssertEqual(media.format, .tv)
        XCTAssertEqual(media.status, .finished)
        XCTAssertEqual(media.episodes, 26)
        XCTAssertEqual(media.startDate?.year, 1998)
        XCTAssertEqual(media.genres?.count, 2)
    }
    
    func testSearchQueryVariablesEncoding() throws {
        let query = AniListQueries.SearchQuery(
            page: 2,
            perPage: 10,
            search: "Naruto",
            type: .anime,
            sort: [.popularityDesc],
            isAdult: false
        )
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let encodedData = try encoder.encode(query.variables)
        let jsonString = try XCTUnwrap(String(data: encodedData, encoding: .utf8))
        
        XCTAssertTrue(jsonString.contains("\"page\":2"))
        XCTAssertTrue(jsonString.contains("\"perPage\":10"))
        XCTAssertTrue(jsonString.contains("\"search\":\"Naruto\""))
        XCTAssertTrue(jsonString.contains("\"type\":\"ANIME\""))
        XCTAssertTrue(jsonString.contains("\"isAdult\":false"))
        XCTAssertTrue(jsonString.contains("\"sort\":[\"POPULARITY_DESC\"]"))
    }
    
    func testActivityDecoding() throws {
        let jsonResponse = """
        {
            "__typename": "TextActivity",
            "id": 12345,
            "type": "TEXT",
            "replyCount": 5,
            "text": "Hello world",
            "likeCount": 10,
            "createdAt": 1600000000
        }
        """
        
        let decoder = JSONDecoder()
        let data = try XCTUnwrap(jsonResponse.data(using: .utf8))
        let activity = try decoder.decode(Activity.self, from: data)
        
        guard case .text(let textActivity) = activity else {
            XCTFail("Expected TextActivity")
            return
        }
        
        XCTAssertEqual(textActivity.id, 12345)
        XCTAssertEqual(textActivity.type, .text)
        XCTAssertEqual(textActivity.replyCount, 5)
        XCTAssertEqual(textActivity.text, "Hello world")
        XCTAssertEqual(textActivity.likeCount, 10)
        XCTAssertEqual(textActivity.createdAt, 1600000000)
    }
}
