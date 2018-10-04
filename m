Return-Path: <jean-marie.verdun@splitted-desktop.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=splitted-desktop.com
 (client-ip=212.129.40.140; helo=three.splitted-desktop.com;
 envelope-from=jean-marie.verdun@splitted-desktop.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=splitted-desktop.com
X-Greylist: delayed 2123 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Oct 2018 19:40:39 AEST
Received: from three.splitted-desktop.com (three.splitted-desktop.com
 [212.129.40.140])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Qntv2LwFzDqkL
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 19:40:38 +1000 (AEST)
Received: from 176-184-187-169.abo.bbox.fr ([176.184.187.169]
 helo=[192.168.0.105]) by three.splitted-desktop.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
 (envelope-from <jean-marie.verdun@splitted-desktop.com>)
 id 1g7zYB-0003um-0n
 for openbmc@lists.ozlabs.org; Thu, 04 Oct 2018 11:04:03 +0200
Reply-To: jean-marie.verdun@splitted-desktop.com
Subject: OpenBMC on OCP Leopard server
To: openbmc@lists.ozlabs.org
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
 <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
 <16FCAE4F-97EB-4D32-BB14-5C24578773A6@fb.com>
 <CALLMt=rEH2wBzB5RrHJTG93AgHJB-DaG7pJVs9_UNrktpoau1g@mail.gmail.com>
 <937C5B58-38CB-44C0-8F49-63019A5049B3@fb.com>
From: Jean-Marie Verdun <jean-marie.verdun@splitted-desktop.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jean-marie.verdun@splitted-desktop.com; prefer-encrypt=mutual; 
 keydata=
 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
Message-ID: <4b147bc4-9df1-cd30-ca06-4af0c93d125e@splitted-desktop.com>
Date: Thu, 4 Oct 2018 11:03:57 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <937C5B58-38CB-44C0-8F49-63019A5049B3@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2018 09:40:39 -0000

Hi,

OCP Leopard servers comes with an ASPeed Chip 1250, and doesn't seems to
be supported with OpenBMC (I might be totally wrong but I didn't found
any recipes within the source tree for that platform). So is there any
specific reasons over perhaps community interest of why this machine is
not supported ?

A guy involved in the linuxboot development team has created a funny for
of the project based on u-root called u-bmc which works as a PoC on
Leopard. The BMC starts in a couple of seconds (I think 8s in that case)
and is operationnal.

Is there a porting guide somewhere ? I liked to get this machine
supported on OpenBMC for various reason, and that might be my first try
with it.

vejmarie
