# Change Log
## Unreleased
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.12.3...master)

## v0.12.3
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.12.2...v0.12.3)

* Enable MFA requirement for gem releasing
  * https://github.com/asonas/chatwork-ruby/pull/75

## v0.12.2
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.12.1...v0.12.2)

* Support faraday v1.0
  * https://github.com/asonas/chatwork-ruby/pull/70

## v0.12.1
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.12.0...v0.12.1)

* Fixed. set status code and body when unexpected error is occurred
  * https://github.com/asonas/chatwork-ruby/pull/68

## v0.12.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.11.0...v0.12.0)

* Add 'limit_type' to task read/write API.
  * https://github.com/asonas/chatwork-ruby/pull/66

## v0.11.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.10.0...v0.11.0)

* Support task complete/incomplete api
  * https://github.com/asonas/chatwork-ruby/pull/64

## v0.10.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.9.0...v0.10.0)

* Add file upload method
  * https://github.com/asonas/chatwork-ruby/pull/55

## v0.9.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.8.0...v0.9.0)

* Add `self_unread` option to `ChatWork::Client#create_message` and `ChatWork::Message.create`
  * https://github.com/asonas/chatwork-ruby/pull/52

## v0.8.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.7.0...v0.8.0)

* Add instance methods of `ChatWork::Client`
  * https://github.com/asonas/chatwork-ruby/pull/49
* Fixed. API method did not accept block
  * https://github.com/asonas/chatwork-ruby/pull/50

## v0.7.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.6.2...v0.7.0)

* Support Invitation Link API
  * https://github.com/asonas/chatwork-ruby/pull/46

## v0.6.2
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.6.1...v0.6.2)

* Fixed. `NoMethodError` when error response is empty
  * https://github.com/asonas/chatwork-ruby/pull/43
* Fixed. uninitialized constant `ChatWork::AuthenticateError` when other error class has not been called at all
  * https://github.com/asonas/chatwork-ruby/pull/45

## v0.6.1
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.6.0...v0.6.1)

* Fixed: ArgumentError when ChatWork::Token.refresh_access_token
  * https://github.com/asonas/chatwork-ruby/pull/39

## v0.6.0
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.5.0...v0.6.0)

* Support all ChatWork APIs
  * https://github.com/asonas/chatwork-ruby/pull/34
* raise error when status 4xx and 5xx
  * https://github.com/asonas/chatwork-ruby/pull/35
* Returns `Hashie::Mash` instead of `Hash`
  * https://github.com/asonas/chatwork-ruby/pull/36
* and many refactorings!
  * https://github.com/asonas/chatwork-ruby/pull/22
  * https://github.com/asonas/chatwork-ruby/pull/23
  * https://github.com/asonas/chatwork-ruby/pull/24
  * https://github.com/asonas/chatwork-ruby/pull/25
  * https://github.com/asonas/chatwork-ruby/pull/26
  * https://github.com/asonas/chatwork-ruby/pull/27
  * https://github.com/asonas/chatwork-ruby/pull/28
  * https://github.com/asonas/chatwork-ruby/pull/29
  * https://github.com/asonas/chatwork-ruby/pull/30

## [v0.5.0](https://github.com/asonas/chatwork-ruby/tree/v0.5.0) (2017-11-29)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.4.1...v0.5.0)

**Merged pull requests:**

- Support ChatWork OAuth [\#21](https://github.com/asonas/chatwork-ruby/pull/21) ([sue445](https://github.com/sue445))
- Refactor: remove `require` in each spec file [\#20](https://github.com/asonas/chatwork-ruby/pull/20) ([sue445](https://github.com/sue445))
- Relax rspec version [\#19](https://github.com/asonas/chatwork-ruby/pull/19) ([sue445](https://github.com/sue445))
- Add block expression [\#16](https://github.com/asonas/chatwork-ruby/pull/16) ([yuyaan](https://github.com/yuyaan))

## [v0.4.1](https://github.com/asonas/chatwork-ruby/tree/v0.4.1) (2017-02-17)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.4.0...v0.4.1)

**Merged pull requests:**

- Relax faraday dependency for faraday v0.11.0 [\#18](https://github.com/asonas/chatwork-ruby/pull/18) ([sue445](https://github.com/sue445))

## [v0.4.0](https://github.com/asonas/chatwork-ruby/tree/v0.4.0) (2017-01-31)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.3.1...v0.4.0)

**Merged pull requests:**

- api v2 release [\#14](https://github.com/asonas/chatwork-ruby/pull/14) ([hatappi](https://github.com/hatappi))
- 🏠 Set the homepage URL [\#13](https://github.com/asonas/chatwork-ruby/pull/13) ([amatsuda](https://github.com/amatsuda))

## [v0.3.1](https://github.com/asonas/chatwork-ruby/tree/v0.3.1) (2016-07-20)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.3.0...v0.3.1)

**Closed issues:**

- api\_keyはデフォルトで環境変数を使ってほしい [\#11](https://github.com/asonas/chatwork-ruby/issues/11)

**Merged pull requests:**

- Fixed a typo and bug [\#9](https://github.com/asonas/chatwork-ruby/pull/9) ([henteko](https://github.com/henteko))

## [v0.3.0](https://github.com/asonas/chatwork-ruby/tree/v0.3.0) (2016-06-20)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.2.0...v0.3.0)

**Merged pull requests:**

- api\_keyのデフォルトを環境変数にする [\#12](https://github.com/asonas/chatwork-ruby/pull/12) ([hatappi](https://github.com/hatappi))

## [v0.2.0](https://github.com/asonas/chatwork-ruby/tree/v0.2.0) (2015-10-21)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.1.2...v0.2.0)

**Merged pull requests:**

- Implement Contacts \#get method [\#10](https://github.com/asonas/chatwork-ruby/pull/10) ([cy-ken-goto](https://github.com/cy-ken-goto))

## [v0.1.2](https://github.com/asonas/chatwork-ruby/tree/v0.1.2) (2015-02-24)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.1.1...v0.1.2)

**Merged pull requests:**

- Implement Member\#get method. [\#8](https://github.com/asonas/chatwork-ruby/pull/8) ([tamano](https://github.com/tamano))

## [v0.1.1](https://github.com/asonas/chatwork-ruby/tree/v0.1.1) (2015-01-29)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.1.0...v0.1.1)

**Merged pull requests:**

- Define Room\#get method. [\#7](https://github.com/asonas/chatwork-ruby/pull/7) ([tokada](https://github.com/tokada))

## [v0.1.0](https://github.com/asonas/chatwork-ruby/tree/v0.1.0) (2015-01-26)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.7...v0.1.0)

**Merged pull requests:**

- Implements tasks [\#6](https://github.com/asonas/chatwork-ruby/pull/6) ([asonas](https://github.com/asonas))

## [v0.0.7](https://github.com/asonas/chatwork-ruby/tree/v0.0.7) (2015-01-20)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.6...v0.0.7)

**Merged pull requests:**

- Add get messages API. [\#5](https://github.com/asonas/chatwork-ruby/pull/5) ([tamano](https://github.com/tamano))

## [v0.0.6](https://github.com/asonas/chatwork-ruby/tree/v0.0.6) (2014-12-19)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.5...v0.0.6)

**Merged pull requests:**

- Add Tasks [\#4](https://github.com/asonas/chatwork-ruby/pull/4) ([tamano](https://github.com/tamano))

## [v0.0.5](https://github.com/asonas/chatwork-ruby/tree/v0.0.5) (2014-04-20)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.3...v0.0.5)

**Merged pull requests:**

- faraday gem update [\#2](https://github.com/asonas/chatwork-ruby/pull/2) ([yoneapp](https://github.com/yoneapp))

## [v0.0.3](https://github.com/asonas/chatwork-ruby/tree/v0.0.3) (2013-12-30)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.2...v0.0.3)

## [v0.0.2](https://github.com/asonas/chatwork-ruby/tree/v0.0.2) (2013-11-29)
[Full Changelog](https://github.com/asonas/chatwork-ruby/compare/v0.0.1...v0.0.2)

**Merged pull requests:**

- Fix a typo in ChatWork module [\#1](https://github.com/asonas/chatwork-ruby/pull/1) ([eitoball](https://github.com/eitoball))

## [v0.0.1](https://github.com/asonas/chatwork-ruby/tree/v0.0.1) (2013-11-28)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
