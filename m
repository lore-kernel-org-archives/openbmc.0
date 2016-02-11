Return-Path: <njames@us.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1712F1A0045
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 05:34:25 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 11 Feb 2016 11:34:23 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 11:34:22 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 92C4C1FF0041
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 11:22:31 -0700 (MST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BIYLxm30539860
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 18:34:21 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BIYLip019665
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 13:34:21 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1BIYK4d019583
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 13:34:20 -0500
Message-Id: <201602111834.u1BIYK4d019583@d01av02.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 11 Feb 2016 11:34:20 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 11 Feb 2016 11:34:18 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 11 Feb 2016 18:34:17 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 11 Feb 2016 18:34:15 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016021118361175-407505 ;
 Thu, 11 Feb 2016 18:36:11 +0000 
In-Reply-To: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
Subject: Re: [PATCH 1/2] serial/aspeed-vuart: Only disable host tx discard when
 serial port is in use
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: "Norman James" <njames@us.ibm.com>
Date: Thu, 11 Feb 2016 12:34:08 -0600
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
X-KeepSent: DE43A6B4:C4D97E9E-00257F56:0065C5A7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 4071
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337"
x-cbid: 16021118-0025-0000-0000-0000214A4056
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.287489; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004905; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000143; SDB=6.00658497; UDB=6.00298985; UTC=2016-02-11
 18:34:16
x-cbparentid: 16021118-9900-0000-0000-00000615E2DD
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 18:34:26 -0000

--0__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337"


--1__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


I tried this with various cases of console usage.  Starting console in
beginning, in the middle, never, etc.  Seems to work.  Please get merged
ASAP.  Thanks!


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Jeremy Kerr <jk@ozlabs.org>
To:	openbmc@lists.ozlabs.org
Date:	02/11/2016 03:03 AM
Subject:	[PATCH 1/2] serial/aspeed-vuart: Only disable host tx discard
            when serial port is in use
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



OpenPOWER firmware doesn't like it when the host-side of the VUART's
FIFO is not drained. This change shifts only disables host TX discard
mode when the port has been opened.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/aspeed-vuart.c | 40 ++++++++++++++++++++++++++++++++++
+----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/aspeed-vuart.c
b/drivers/tty/serial/aspeed-vuart.c
index f34884a..73bb0e7 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -144,16 +144,45 @@ static ssize=5Ft ast=5Fvuart=5Fset=5Fsirq(struct devi=
ce *dev,
 static DEVICE=5FATTR(sirq, S=5FIWUSR | S=5FIRUGO,
 		 		 ast=5Fvuart=5Fshow=5Fsirq, ast=5Fvuart=5Fset=5Fsirq);

-static void ast=5Fvuart=5Fsetup(struct ast=5Fvuart *vuart)
+static void ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(struct ast=5Fvuart *vu=
art, bool
discard)
 {
 		 u8 reg;

-		 /* disable TX discard mode */
 		 reg =3D readb(vuart->regs + AST=5FVUART=5FGCRA);
-		 reg |=3D AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD;
+
+		 /* if the HOST=5FTX=5FDISCARD bit is set, discard is *disabled* */
+		 reg &=3D ~AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD;
+		 if (!discard)
+		 		 reg |=3D AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD;
+
 		 writeb(reg, vuart->regs + AST=5FVUART=5FGCRA);
 }

+static int ast=5Fvuart=5Fstartup(struct uart=5Fport *uart=5Fport)
+{
+		 struct uart=5F8250=5Fport *uart=5F8250=5Fport =3D up=5Fto=5Fu8250p
(uart=5Fport);
+		 struct ast=5Fvuart *vuart =3D uart=5F8250=5Fport->port.private=5Fdata;
+		 int rc;
+
+		 rc =3D serial8250=5Fdo=5Fstartup(uart=5Fport);
+		 if (rc)
+		 		 return rc;
+
+		 ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, false);
+
+		 return 0;
+}
+
+static void ast=5Fvuart=5Fshutdown(struct uart=5Fport *uart=5Fport)
+{
+		 struct uart=5F8250=5Fport *uart=5F8250=5Fport =3D up=5Fto=5Fu8250p
(uart=5Fport);
+		 struct ast=5Fvuart *vuart =3D uart=5F8250=5Fport->port.private=5Fdata;
+
+		 ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, true);
+
+		 serial8250=5Fdo=5Fshutdown(uart=5Fport);
+}
+

 /**
  * The device tree parsing code here is heavily based on that of the
of=5Fserial
@@ -190,9 +219,12 @@ static int ast=5Fvuart=5Fprobe(struct platform=5Fdevice
*pdev)
 		 }

 		 memset(&port, 0, sizeof(port));
+		 port.port.private=5Fdata =3D vuart;
 		 port.port.membase =3D vuart->regs;
 		 port.port.mapbase =3D resource.start;
 		 port.port.mapsize =3D resource=5Fsize(&resource);
+		 port.port.startup =3D ast=5Fvuart=5Fstartup;
+		 port.port.shutdown =3D ast=5Fvuart=5Fshutdown;

 		 if (of=5Fproperty=5Fread=5Fu32(np, "clock-frequency", &clk)) {
 		 		 vuart->clk =3D devm=5Fclk=5Fget(&pdev->dev, NULL);
@@ -272,8 +304,8 @@ static int ast=5Fvuart=5Fprobe(struct platform=5Fdevice
*pdev)


 		 vuart->line =3D rc;
+		 ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, true);
 		 platform=5Fset=5Fdrvdata(pdev, vuart);
-		 ast=5Fvuart=5Fsetup(vuart);

 		 /* extra sysfs control */
 		 rc =3D device=5Fcreate=5Ffile(&pdev->dev, &dev=5Fattr=5Flpc=5Faddress);
--
2.5.0

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>I tried this with various cases of console usage.  Starting =
console in beginning, in the middle, never, etc.  Seems to work.  Please ge=
t merged ASAP.  Thanks!<br><br><br>Regards,<br>Norman James<br>IBM - POWER =
Systems Architect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: nja=
mes@us.ibm.com<br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=
=5F=3D8FBBF5C5DFF643378f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inactiv=
e hide details for Jeremy Kerr ---02/11/2016 03:03:20 AM---OpenPOWER firmwa=
re doesn't like it when the host-side of the "><font color=3D"#424282">Jere=
my Kerr ---02/11/2016 03:03:20 AM---OpenPOWER firmware doesn't like it when=
 the host-side of the VUART's FIFO is not drained. This chang</font><br><br=
><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Je=
remy Kerr &lt;jk@ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F=
">To:        </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><fo=
nt size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">02/11/=
2016 03:03 AM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        =
</font><font size=3D"2">[PATCH 1/2] serial/aspeed-vuart: Only disable host =
tx discard when serial port is in use</font><br><font size=3D"2" color=3D"#=
5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;ope=
nbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=
=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><=
br><br><tt>OpenPOWER firmware doesn't like it when the host-side of the VUA=
RT's<br>FIFO is not drained. This change shifts only disables host TX disca=
rd<br>mode when the port has been opened.<br><br>Signed-off-by: Jeremy Kerr=
 &lt;jk@ozlabs.org&gt;<br>---<br> drivers/tty/serial/aspeed-vuart.c | 40 ++=
+++++++++++++++++++++++++++++++++----<br> 1 file changed, 36 insertions(+),=
 4 deletions(-)<br><br>diff --git a/drivers/tty/serial/aspeed-vuart.c b/dri=
vers/tty/serial/aspeed-vuart.c<br>index f34884a..73bb0e7 100644<br>--- a/dr=
ivers/tty/serial/aspeed-vuart.c<br>+++ b/drivers/tty/serial/aspeed-vuart.c<=
br>@@ -144,16 +144,45 @@ static ssize=5Ft ast=5Fvuart=5Fset=5Fsirq(struct d=
evice *dev,<br> static DEVICE=5FATTR(sirq, S=5FIWUSR | S=5FIRUGO,<br>      =
                             ast=5Fvuart=5Fshow=5Fsirq, ast=5Fvuart=5Fset=
=5Fsirq);<br> <br>-static void ast=5Fvuart=5Fsetup(struct ast=5Fvuart *vuar=
t)<br>+static void ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(struct ast=5Fvua=
rt *vuart, bool discard)<br> {<br>                  u8 reg;<br> <br>-      =
           /* disable TX discard mode */<br>                  reg =3D readb=
(vuart-&gt;regs + AST=5FVUART=5FGCRA);<br>-                 reg |=3D AST=5F=
VUART=5FGCRA=5FHOST=5FTX=5FDISCARD;<br>+<br>+                 /* if the HOS=
T=5FTX=5FDISCARD bit is set, discard is *disabled* */<br>+                 =
reg &amp;=3D ~AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD;<br>+               =
  if (!discard)<br>+                                  reg |=3D AST=5FVUART=
=5FGCRA=5FHOST=5FTX=5FDISCARD;<br>+<br>                  writeb(reg, vuart-=
&gt;regs + AST=5FVUART=5FGCRA);<br> }<br> <br>+static int ast=5Fvuart=5Fsta=
rtup(struct uart=5Fport *uart=5Fport)<br>+{<br>+                 struct uar=
t=5F8250=5Fport *uart=5F8250=5Fport =3D up=5Fto=5Fu8250p(uart=5Fport);<br>+=
                 struct ast=5Fvuart *vuart =3D uart=5F8250=5Fport-&gt;port.=
private=5Fdata;<br>+                 int rc;<br>+<br>+                 rc =
=3D serial8250=5Fdo=5Fstartup(uart=5Fport);<br>+                 if (rc)<br=
>+                                  return rc;<br>+<br>+                 as=
t=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, false);<br>+<br>+             =
    return 0;<br>+}<br>+<br>+static void ast=5Fvuart=5Fshutdown(struct uart=
=5Fport *uart=5Fport)<br>+{<br>+                 struct uart=5F8250=5Fport =
*uart=5F8250=5Fport =3D up=5Fto=5Fu8250p(uart=5Fport);<br>+                =
 struct ast=5Fvuart *vuart =3D uart=5F8250=5Fport-&gt;port.private=5Fdata;<=
br>+<br>+                 ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, tr=
ue);<br>+<br>+                 serial8250=5Fdo=5Fshutdown(uart=5Fport);<br>=
+}<br>+<br> <br> /**<br> &nbsp;* The device tree parsing code here is heavi=
ly based on that of the of=5Fserial<br>@@ -190,9 +219,12 @@ static int ast=
=5Fvuart=5Fprobe(struct platform=5Fdevice *pdev)<br>                  }<br>=
 <br>                  memset(&amp;port, 0, sizeof(port));<br>+            =
     port.port.private=5Fdata =3D vuart;<br>                  port.port.mem=
base =3D vuart-&gt;regs;<br>                  port.port.mapbase =3D resourc=
e.start;<br>                  port.port.mapsize =3D resource=5Fsize(&amp;re=
source);<br>+                 port.port.startup =3D ast=5Fvuart=5Fstartup;<=
br>+                 port.port.shutdown =3D ast=5Fvuart=5Fshutdown;<br> <br=
>                  if (of=5Fproperty=5Fread=5Fu32(np, &quot;clock-frequency=
&quot;, &amp;clk)) {<br>                                   vuart-&gt;clk =
=3D devm=5Fclk=5Fget(&amp;pdev-&gt;dev, NULL);<br>@@ -272,8 +304,8 @@ stati=
c int ast=5Fvuart=5Fprobe(struct platform=5Fdevice *pdev)<br> <br> <br>    =
              vuart-&gt;line =3D rc;<br>+                 ast=5Fvuart=5Fset=
=5Fhost=5Ftx=5Fdiscard(vuart, true);<br>                  platform=5Fset=5F=
drvdata(pdev, vuart);<br>-                 ast=5Fvuart=5Fsetup(vuart);<br> =
<br>                  /* extra sysfs control */<br>                  rc =3D=
 device=5Fcreate=5Ffile(&amp;pdev-&gt;dev, &amp;dev=5Fattr=5Flpc=5Faddress)=
;<br>-- <br>2.5.0<br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><=
/tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists=
.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337--


--0__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBBF5C5DFF643378f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBBF5C5DFF643378f9e8a93df938690918c8FBBF5C5DFF64337--
