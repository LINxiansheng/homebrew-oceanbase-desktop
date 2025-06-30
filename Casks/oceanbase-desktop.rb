cask 'oceanbase-desktop' do
  version '1.0.0'
  sha256 '10b82028247f3fb9699659cdbe64d9280728a10f5155f07277f7f1ccb5d5c620'

  url "https://obbusiness-private.oss-cn-shanghai.aliyuncs.com/download-center/opensource/obdesktop/4.3.5.0/OceanBase-Desktop-#{version}-arm64.dmg"
  name 'https://open.oceanbase.com/'
  desc 'OceanBase Desktop - A GUI tool for installing and managing OceanBase'
  homepage 'https://www.oceanbase.com/'

  depends_on cask: 'orbstack'

  app 'OceanBase-Desktop.app'

  zap trash: [
    '~/Library/Application Support/OceanBase Desktop',
    '~/Library/Preferences/com.oceanbase.desktop.plist',
    '~/Library/Saved Application State/com.oceanbase.desktop.savedState'
  ]
end