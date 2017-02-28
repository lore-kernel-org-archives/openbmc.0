Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXbcs1ZYJzDqH8
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 22:16:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MkvRh5L1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fiiS9AiO"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C8B13205E3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 06:16:39 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 28 Feb 2017 06:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=mesmtp; bh=WOTRch7V3LHwxZqxnAByLOI32J
 o=; b=MkvRh5L1KBBopxT3jmo9Wpypz9/8adIBVYtUX5XEUKA9i8OVF0zbLCh6Jh
 s5VpmFVWqtUIKNQnKf6E4aODpRK3+Ua3/48l9UI2FhadfntSjRHAviPAPASgokT2
 8QLexzkieY0TXSbYFGMPWwWkZAcI78zZ4Xq1RXCgtlMFISDBo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=smtpout; bh=WO
 TRch7V3LHwxZqxnAByLOI32Jo=; b=fiiS9AiOXzp2Hp+6ftfclk+I5POpqaqb41
 kIJ36LFtiloqaClDHSHESy3dO5dxwIFL7h5zw0yXGoG9fgDqzjNGHCGKbXmg4Pcz
 G1f022IqSsWqVwYjmOpM2DiZ/0Yh0uC5MMB3b06QvtOeYQDIYTO185/8rYaPDfVu
 ILNG0wlhk=
X-ME-Sender: <xms:F1y1WEVjcIg7XCAbXA4fhLX5C9NZ3qGW_cBXGhP8tyPKdi1yIFP0nA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 997EFBAB57; Tue, 28 Feb 2017 06:16:39 -0500 (EST)
Message-Id: <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative; boundary="_----------=_148828059924231832"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-715c2c0c
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
In-Reply-To: <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
Date: Tue, 28 Feb 2017 21:46:39 +1030
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2017 11:16:46 -0000

This is a multi-part message in MIME format.

--_----------=_148828059924231832
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 28, 2017, at 20:10, Joel Stanley wrote:

> 

> 

> On 28 Feb 2017 17:49, "Lei YU" <mine260309@gmail.com> wrote:
>> The PNOR SPI address mapping is the same as Witherspoon.
> 

> This should be handled by the device drivers we now have.

> 

> Mbox brains trust, any idea why we would still need this?



I was going to say NAK for the same reason.



Lei: are you absolutely positive you need this? If you do something has gone wrong. Is mboxd integrated into the romulus image? If not we need a yocto patch rather than a kernel patch.


Andrew



> Cheers,

> 

> Joel

> 

>> 

>> Signed-off-by: Lei YU <mine260309@gmail.com>

>>  ---

>>   arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++

>>   1 file changed, 18 insertions(+)

>> 

>>  diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-
>>  aspeed/aspeed.c
>>  index 726b8fa..ec9eecf 100644

>>  --- a/arch/arm/mach-aspeed/aspeed.c

>>  +++ b/arch/arm/mach-aspeed/aspeed.c

>>  @@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)

>>   static void __init do_romulus_setup(void)

>>   {

>>          do_common_setup();

>>  +

>>  +       /* Setup PNOR address mapping for 64M flash

>>  +        *

>>  +        *   ADRBASE: 0x3000 (0x30000000)

>>  +        *   HWMBASE: 0x0C00 (0x0C000000)

>>  +        *  ADDRMASK: 0xFC00 (0xFC000000)

>>  +        *   HWNCARE: 0x03FF (0x03FF0000)

>>  +        *

>>  +        * Mapping appears at 0x60300fc000000 on the host

>>  +        */

>>  +       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));

>>  +       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));

>>  +

>>  +       /* Set SPI1 CE1 decoding window to 0x34000000 */

>>  +       writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));

>>  +

>>  +       /* Set SPI1 CE0 decoding window to 0x30000000 */

>>  +       writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));

>>   }

>> 

>>   #define SCU_PASSWORD   0x1688A8A8

>> --
>>  1.9.1

--_----------=_148828059924231832
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body><div><span style="font-size: 17.145px; line-height: 1.32; letter-spacing: 0.1px;">On Tue, Feb 28, 2017, at 20:10, Joel Stanley wrote:</span><br></div>
<blockquote type="cite"><div><div><div><br></div>
<div><div><br></div>
<div defang_data-gmailquote="yes"><div>On 28 Feb 2017 17:49, "Lei YU" &lt;<a href="mailto:mine260309@gmail.com">mine260309@gmail.com</a>&gt; wrote:<br></div>
<blockquote style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1ex;">The PNOR SPI address mapping is the same as Witherspoon.<br></blockquote></div>
</div>
</div>
<div><br></div>
<div>This should be handled by the device drivers we now have.<br></div>
<div><br></div>
<div>Mbox brains trust, any idea why we would still need this?<br></div>
</div>
</blockquote><div><br></div>
<div>I was going to say NAK for the same reason.<br></div>
<div><br></div>
<div>Lei: are you absolutely positive you need this? If you do something has gone wrong. Is mboxd integrated into the romulus image? If not we need a yocto patch rather than a kernel patch.<br></div>
<div><br></div>
<div>Andrew</div>
<div><br></div>
<blockquote type="cite"><div><div>Cheers,<br></div>
<div><br></div>
<div>Joel<br></div>
<div><br></div>
<div><div><div defang_data-gmailquote="yes"><blockquote style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1ex;"><div><br></div>
<div>Signed-off-by: Lei YU &lt;<a href="mailto:mine260309@gmail.com">mine260309@gmail.com</a>&gt;<br></div>
<div> ---<br></div>
<div> &nbsp;arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++<br></div>
<div> &nbsp;1 file changed, 18 insertions(+)<br></div>
<div> <br></div>
<div> diff --git a/arch/arm/mach-aspeed/aspeed.<wbr>c b/arch/arm/mach-aspeed/aspeed.<wbr>c<br></div>
<div> index 726b8fa..ec9eecf 100644<br></div>
<div> --- a/arch/arm/mach-aspeed/aspeed.<wbr>c<br></div>
<div> +++ b/arch/arm/mach-aspeed/aspeed.<wbr>c<br></div>
<div> @@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)<br></div>
<div> &nbsp;static void __init do_romulus_setup(void)<br></div>
<div> &nbsp;{<br></div>
<div> &nbsp; &nbsp; &nbsp; &nbsp; do_common_setup();<br></div>
<div> +<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;/* Setup PNOR address mapping for 64M flash<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *&nbsp; &nbsp;ADRBASE: 0x3000 (0x30000000)<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *&nbsp; &nbsp;HWMBASE: 0x0C00 (0x0C000000)<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *&nbsp; ADDRMASK: 0xFC00 (0xFC000000)<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *&nbsp; &nbsp;HWNCARE: 0x03FF (0x03FF0000)<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; *<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; * Mapping appears at 0x60300fc000000 on the host<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp; */<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));<br></div>
<div> +<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;/* Set SPI1 CE1 decoding window to 0x34000000 */<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));<br></div>
<div> +<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;/* Set SPI1 CE0 decoding window to 0x30000000 */<br></div>
<div> +&nbsp; &nbsp; &nbsp; &nbsp;writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));<br></div>
<div> &nbsp;}<br></div>
<div> <br></div>
<div> &nbsp;#define SCU_PASSWORD&nbsp; &nbsp;0x1688A8A8<br></div>
<div> <span class="colour" style="color:rgb(136, 136, 136)">--<br> 1.9.1<br> </span></div>
</blockquote></div>
</div>
</div>
</div>
</blockquote></body>
</html>

--_----------=_148828059924231832--
