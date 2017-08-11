Return-Path: <d.mueller@elsoft.ch>
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTSXQ2Zx9zDrFs
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 00:47:33 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id EA868164C2;
 Fri, 11 Aug 2017 16:47:29 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id jOG-1bBSkhof; Fri, 11 Aug 2017 16:47:29 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id 9EB0F16559;
 Fri, 11 Aug 2017 16:47:28 +0200 (CEST)
Subject: Re: Crashing Phosphor Settings Manager
To: Chris Austen <austenc@us.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
 <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
 <1502374854.1431709.1069264592.5D5C9137@webmail.messagingengine.com>
 <OF17629436.FAAE5DE7-ON86258178.00512E66-86258178.007947E6@notes.na.collabserv.com>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <21f8060c-c5a3-ac04-4542-35b3b894c383@elsoft.ch>
Date: Fri, 11 Aug 2017 16:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:51.0) Gecko/20100101 Firefox/51.0
 SeaMonkey/2.48
MIME-Version: 1.0
In-Reply-To: <OF17629436.FAAE5DE7-ON86258178.00512E66-86258178.007947E6@notes.na.collabserv.com>
Content-Type: text/plain; charset=ISO-8859-1
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
X-List-Received-Date: Fri, 11 Aug 2017 14:47:35 -0000

Hello

Thanks for the hint.

Chris Austen wrote:

> I don't think there is any one process that is responsible for 
> /org/openbmc/control. It is a parent of other processes though.
> 
> org.openbmc.control.Bmc       /org/openbmc/control/bmc0 
> org.openbmc.control.Power     /org/openbmc/control/power0 
> org.openbmc.control.Chassis   /org/openbmc/control/chassis0 
> org.openbmc.control.BmcFlash  /org/openbmc/control/flash
> 
> So it appears not 1 of the 4 processes is starting up on the
> evb-ast2500 build. That is not a bad thing though.  The
> org.openbmc.control (any org.openbmc really) is in violation of the
> dbus spec and as such we have moved most services over to 
> xyz.openbmc_project.  Seems like the evb-ast2500 is ready to have
> the settings_manager.py from phosphor/settingd repository fixed up.
> 
> So you can ignore that message and focus on the /xyz/openbmc/control 
> interfaces

This should be "/xyz/openbmc_project/control", isn't it?


Dave
