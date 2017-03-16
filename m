Return-Path: <d.mueller@elsoft.ch>
X-Greylist: delayed 639 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Mar 2017 19:16:06 AEDT
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkLs24GtPzDqXf
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 19:16:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 8B2F516544;
 Thu, 16 Mar 2017 09:05:22 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id JUlZhkUDDFXc; Thu, 16 Mar 2017 09:05:22 +0100 (CET)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id 877651672F;
 Thu, 16 Mar 2017 09:05:19 +0100 (CET)
Subject: Re: [PATCH linux v4 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
References: <20170311015351.23092-1-jaghu@google.com>
 <20170311015351.23092-2-jaghu@google.com>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <6c028b76-ccc3-46ba-7a41-fa1b7b4a5b77@elsoft.ch>
Date: Thu, 16 Mar 2017 09:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:49.0) Gecko/20100101 Firefox/49.0
 SeaMonkey/2.46
MIME-Version: 1.0
In-Reply-To: <20170311015351.23092-2-jaghu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 16 Mar 2017 08:16:07 -0000

Hello

Jaghathiswari Rankappagounder Natarajan wrote:

> +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400
> or +	       "aspeed,aspeed2500-pwm-tacho" for AST2500.

Shouldn't this be "aspeed,ast2400-pwm-tacho" and
"aspeed,ast2500-pwm-tacho", as this is the naming scheme used for all
the other AST2x00 devices currently present in "aspeed-g[45].dtsi"?

Dave
