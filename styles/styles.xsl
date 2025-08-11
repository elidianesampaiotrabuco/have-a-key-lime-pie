<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:manifest="http://schemas.android.com/git-repo/manifest">
  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <html lang="en">
      <body>
        <xsl:apply-templates select="/manifest:manifest" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="manifest:manifest">
    <xsl:if test="//manifest:notice">
      <h2>Notice</h2>
      <xsl:apply-templates select="//manifest:notice" />
    </xsl:if>
    <xsl:if test="//manifest:contactinfo">
      <h2>Contact Info</h2>
      <xsl:apply-templates select="//manifest:contactinfo" />
    </xsl:if>
    <xsl:if test="//manifest:notice|//manifest:contactinfo">
      <hr />
    </xsl:if>
    <xsl:if
      test="//manifest:manifest-server">
      <h2>Manifest Servers</h2>
      <ul>
        <xsl:apply-templates select="//manifest:manifest-server" />
      </ul>
    </xsl:if>
    <xsl:if
      test="//manifest:include">
      <h2>Included Manifests</h2>
      <xsl:apply-templates select="//manifest:include" />
    </xsl:if>
    <xsl:if
      test="//manifest:submanifest">
      <h2>Submanifests</h2>
      <xsl:apply-templates select="//manifest:submanifest" />
    </xsl:if>
    <xsl:if test="//manifest:manifest-server|//manifest:include|//manifest:submanifest">
      <hr />
    </xsl:if>
    <xsl:if
      test="//manifest:superproject">
      <h2>Superproject</h2>
      <xsl:apply-templates select="//manifest:superproject" />
    </xsl:if>
    <xsl:if
      test="//manifest:default">
      <h2>Default Attributes</h2>
      <xsl:apply-templates select="//manifest:default" />
    </xsl:if>
    <xsl:if
      test="//manifest:remote">
      <h2>Remotes</h2>
      <xsl:apply-templates select="//manifest:remote" />
    </xsl:if>
    <hr />
    <xsl:if
      test="//manifest:project">
      <h2>Projects</h2>
      <xsl:apply-templates select="//manifest:project" />
    </xsl:if>
    <xsl:if
      test="//manifest:remove-project">
      <h2>Remove Projects</h2>
      <xsl:apply-templates select="//manifest:remove-project" />
    </xsl:if>
    <xsl:if
      test="//manifest:extend-project">
      <h2>Extend Projects</h2>
      <xsl:apply-templates select="//manifest:extend-project" />
    </xsl:if>
    <xsl:if
      test="//manifest:repo-hooks">
      <h2>repo Hooks</h2>
      <xsl:apply-templates select="//manifest:repo-hooks" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="manifest:notice">
    <pre>
      <xsl:value-of select="." />
    </pre>
  </xsl:template>

  <xsl:template name="remote">
    <xsl:param name="remote"/>
    <a href="#remote-{@remote}">
      <code>
        <xsl:value-of select="@remote" />
      </code>
    </a>
  </xsl:template>
  <xsl:template name="remote-rev">
    <xsl:param name="revision"/>
    <code><xsl:value-of select="@revision"/></code>
  </xsl:template>

  <xsl:template match="manifest:remote">
    <h3 id="remote-{@name}">
      <code>
        <xsl:value-of select="@name" />
      </code>
    </h3>
    <ul>
      <xsl:if test="@alias">
        <li>Git remote name: <code>
            <xsl:value-of select="@alias" />
          </code>
        </li>
      </xsl:if>
      <li>Fetch prefix: <a href="{@fetch}"><xsl:value-of select="@fetch" /></a>
      </li>
      <xsl:if test="@pushurl">
        <li>Push prefix: <a href="{@pushurl}"><xsl:value-of select="@pushurl" /></a>
        </li>
      </xsl:if>
      <xsl:if test="@review">
        <li>Gerrit server: <a href="{@review}"><xsl:value-of select="@review" /></a>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Target revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:default">
    <ul>
      <xsl:if test="@remote">
        <li>Remote:
          <xsl:call-template name="remote">
            <xsl:with-param name="remote" select="@remote" />
          </xsl:call-template></li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Target revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
          <xsl:if test="@sync-c|@sync-tags">
            <ul>
              <xsl:if test="@sync-c">
                <li>Sync only given branch?: <xsl:value-of select="@sync-c" /></li>
              </xsl:if>
              <xsl:if test="@sync-tags">
                <li>Also sync tags?: <xsl:value-of select="@sync-tags" /></li>
              </xsl:if>
            </ul>
          </xsl:if>
        </li>
      </xsl:if>
      <xsl:if test="@dest-branch">
        <li>Upload destination branch: <code>
            <xsl:value-of select="@dest-branch" />
          </code></li>
      </xsl:if>
      <xsl:if test="@upstream">
        <li>Upstream ref: <code>
            <xsl:value-of select="@upstream" />
          </code></li>
      </xsl:if>
      <xsl:if test="@sync-j">
        <li>Parallel sync jobs: <xsl:value-of select="@sync-j" /></li>
      </xsl:if>
      <xsl:if test="@sync-s">
        <li>Also sync subprojects?: <xsl:value-of select="@sync-s" /></li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:manifest-server">
    <li><a href="{@url}"><xsl:value-of select="@url"/></a></li>
  </xsl:template>

  <xsl:template match="manifest:submanifest">
    <h3>
      <code>
        <xsl:value-of select="@name" />
      </code>
    </h3>
    <ul>
      <xsl:if test="@remote">
        <li>Remote:
          <xsl:call-template name="remote">
            <xsl:with-param name="remote" select="@remote" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@project">
        <li>Project name: <code><xsl:value-of select="@project"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@manifest-name">
        <li>Manifest name: <code><xsl:value-of select="@manifest-name"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Target revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@path">
        <li>Subdirectory path: <code><xsl:value-of select="@path"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@groups">
        <li>Additional groups: <code><xsl:value-of select="@groups"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@default-groups">
        <li>Default groups: <code><xsl:value-of select="@default-groups"/></code>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:remove-project">
    <h3 id="remove-project-{@name}">
      <strike><code>
        <xsl:value-of select="@name|@path" />
      </code></strike>
    </h3>
    <ul>
      <xsl:if test="@name">
        <li>Expected name: <code><xsl:value-of select="@name"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@path">
        <li>Expected path: <code><xsl:value-of select="@path"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@optional">
        <li>Ignore if not present: <code><xsl:value-of select="@optional"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@base-rev">
        <li>Expected base revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@base-rev" />
          </xsl:call-template>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="/manifest:manifest/manifest:project">
    <h3 id="project-{@name}">
      <code>
        <xsl:value-of select="@name" />
      </code>
    </h3>
    <xsl:call-template name="project" />
  </xsl:template>
  <xsl:template match="manifest:project/manifest:project">
    <h4 id="project-{../@name}-{@name}">
      <code>
        <xsl:value-of select="@name" />
      </code>
    </h4>
    <xsl:call-template name="project" />
  </xsl:template>
  <xsl:template name="project" match="manifest:project">
    <ul>
      <xsl:if test="@path">
        <li>Destination path: <code><xsl:value-of select="@path"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@remote">
        <li>Remote:
          <xsl:call-template name="remote">
            <xsl:with-param name="remote" select="@remote" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Target revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
          <xsl:if test="@sync-c|@sync-tags">
            <ul>
              <xsl:if test="@sync-c">
                <li>Sync only given branch?: <xsl:value-of select="@sync-c" /></li>
              </xsl:if>
              <xsl:if test="@sync-tags">
                <li>Also sync tags?: <xsl:value-of select="@sync-tags" /></li>
              </xsl:if>
            </ul>
          </xsl:if>
        </li>
      </xsl:if>
      <xsl:if test="@dest-branch">
        <li>Upload destination branch: <code>
            <xsl:value-of select="@dest-branch" />
          </code></li>
      </xsl:if>
      <xsl:if test="@groups">
        <li>Groups: <code><xsl:value-of select="@groups"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@sync-s">
        <li>Also sync subprojects?: <xsl:value-of select="@sync-s" /></li>
      </xsl:if>
      <xsl:if test="@upstream">
        <li>Upstream ref: <code>
            <xsl:value-of select="@upstream" />
          </code></li>
      </xsl:if>
      <xsl:if test="@clone-depth">
        <li>Clone depth: <code>
            <xsl:value-of select="@clone-depth" />
          </code></li>
      </xsl:if>
      <xsl:if test="@force-path">
        <li>Use path attribute for mirror directory name: <code>
            <xsl:value-of select="@force-path" />
          </code></li>
      </xsl:if>
      <xsl:if test="manifest:annotation">
        <li>Annotations:
          <ul>
            <xsl:apply-templates select="manifest:annotation" />
          </ul>
        </li>
      </xsl:if>
      <xsl:if test="manifest:copyfile">
        <li>Copy files:
          <ul>
            <xsl:apply-templates select="manifest:copyfile" />
          </ul>
        </li>
      </xsl:if>
      <xsl:if test="manifest:linkfile">
        <li>Link files:
          <ul>
            <xsl:apply-templates select="manifest:linkfile" />
          </ul>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:annotation">
    <li><code><xsl:value-of select="@name" /></code>
      = <code><xsl:value-of select="@value" /></code>
      <xsl:if test="@keep">
        (keep = <xsl:value-of select="@keep" />)
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="manifest:copyfile|manifest:linkfile">
    <li><code><xsl:value-of select="@src" /></code> -&gt; <code><xsl:value-of select="@dest" /></code>
    </li>
  </xsl:template>

  <xsl:template match="manifest:extend-project">
    <h3 id="extend-project-{@name}">
      <code>
        <xsl:value-of select="@name" />
      </code>
    </h3>
    <ul>
      <xsl:if test="@path">
        <li>Expected path: <code><xsl:value-of select="@path"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@dest-path">
        <li>Destination path: <code><xsl:value-of select="@dest-path"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@groups">
        <li>Groups: <code><xsl:value-of select="@groups"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Target revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@remote">
        <li>Remote:
          <xsl:call-template name="remote">
            <xsl:with-param name="remote" select="@remote" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@dest-branch">
        <li>Upload destination branch: <code>
            <xsl:value-of select="@dest-branch" />
          </code></li>
      </xsl:if>
      <xsl:if test="@upstream">
        <li>Upstream ref: <code>
            <xsl:value-of select="@upstream" />
          </code></li>
      </xsl:if>
      <xsl:if test="@base-rev">
        <li>Expected base revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@base-rev" />
          </xsl:call-template>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:repo-hooks">
    <ul>
      <li>Use from project: <code><xsl:value-of select="@in-project" /></code></li>
      <li>Hooks to use: <xsl:value-of select="@enabled-list" /></li>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:superproject">
    <h3><code><xsl:value-of select="@name" /></code></h3>
    <ul>
      <xsl:if test="@remote">
        <li>Remote:
          <xsl:call-template name="remote">
            <xsl:with-param name="remote" select="@remote" />
          </xsl:call-template>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Tracking revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:contactinfo">
    <ul>
      <li>Bug tracker:
        <a href="{@bugurl}"><xsl:value-of select="@bugurl" /></a>
      </li>
    </ul>
  </xsl:template>

  <xsl:template match="manifest:include">
    <h3><code><xsl:value-of select="@name" /></code></h3>
    <ul>
      <xsl:if test="@groups">
        <li>Groups: <code><xsl:value-of select="@groups"/></code>
        </li>
      </xsl:if>
      <xsl:if test="@revision">
        <li>Revision:
          <xsl:call-template name="remote-rev">
            <xsl:with-param name="revision" select="@revision" />
          </xsl:call-template>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>
</xsl:stylesheet>