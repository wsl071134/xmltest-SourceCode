<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/> 
<xsl:template match="/">
    <!-- <html>
        <body>
            <xsl:for-each select="code">
                <xsl:for-each select="include">
                    #include "<xsl:value-of select="."/>";<br/>
                </xsl:for-each>
                <xsl:for-each select="namespace">
                    using namespace <xsl:value-of select="."/>;<br/>
                </xsl:for-each>
                <xsl:for-each select="main">
                    int main(int argc,char* argv[]){<br/>
                        <xsl:for-each select="mpi-init">
                            MPI_Init(&amp;argv,&amp;argc);<br/>
                        </xsl:for-each>
                        <xsl:for-each select="cout">
                            cout&lt;&lt;<xsl:value-of select="."/>&lt;&lt;endl;<br/>
                        </xsl:for-each>
                        <xsl:for-each select="mpi-init">
                             MPI_Finalize();<br/>
                        </xsl:for-each>
                         return 0;<br/>
                    }
                </xsl:for-each>
            </xsl:for-each>
        </body>
    </html> -->
    <xsl:for-each select="code">
        <xsl:for-each select="include">
            #include "<xsl:value-of select="."/>"
        </xsl:for-each>
        <xsl:for-each select="namespace">
            using namespace <xsl:value-of select="."/>;
        </xsl:for-each>
        <xsl:for-each select="main">
            int main(int argc,char* argv[]){
                <xsl:for-each select="mpi-init">
                    MPI_Init(&amp;argc,&amp;argv);
                </xsl:for-each>
                <xsl:for-each select="cout">
                    cout&lt;&lt;<xsl:value-of select="."/>&lt;&lt;endl;
                </xsl:for-each>
                <xsl:for-each select="mpi-init">
                    MPI_Finalize();
                </xsl:for-each>
                    return 0;
            }
        </xsl:for-each>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>