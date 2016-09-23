Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgc9Z0bYWzDsnM
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 01:05:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=evrhWT0+; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D5F6B641113;
 Fri, 23 Sep 2016 10:05:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iXTMaeTjl8_7; Fri, 23 Sep 2016 10:05:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 508FC641128;
 Fri, 23 Sep 2016 10:05:19 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 508FC641128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474643119; bh=eLCRZRSKaPOhizJiq1iUwb74luqv1d4fdAdVGqXU+mE=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=evrhWT0+dwulbxYmu48v7KU8SwwjsA39n9c2wAPZmCHnhxaAYZPMa8NzeVaW7fKmX
 sKBKfAC4zgjCgIr/Yy9JHv9PWBXH4pvqnRW1t+MwQEO+ZHIXSgwP6QYn7/2A1jYzgk
 9xy73wJNNJO7dyWVx9BWtKJJ0vFs0yUw+Fy5uoNg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dTRci2090c9c; Fri, 23 Sep 2016 10:05:19 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 2C443640D17;
 Fri, 23 Sep 2016 10:05:19 -0500 (CDT)
Message-ID: <57E544AF.9040604@raptorengineeringinc.com>
Date: Fri, 23 Sep 2016 10:05:19 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 16/17] Add LED expander mapping to Firestone DT
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-17-git-send-email-tpearson@raptorengineering.com>
 <CACPK8XdvqD3f10L5V01_F16xE0UVmN0gWstTThkd2PpNH+=1Mg@mail.gmail.com>
In-Reply-To: <CACPK8XdvqD3f10L5V01_F16xE0UVmN0gWstTThkd2PpNH+=1Mg@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 23 Sep 2016 15:05:22 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/23/2016 02:42 AM, Joel Stanley wrote:
> On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> There is a driver in the Linux kernel for the PCA9552 but it
>> is not yet devicetree-enabled.
> 
> I will hold off until we have the driver working and can define some
> bindings for it.
> 
> Cheers,
> 
> Joel

This is reasonable.  The functions driven by this particular expander
are non-critical.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX5USvAAoJEK+E3vEXDOFbuqsH/0HoLbsq8Nmc3Hyb+vQ7wQQp
JxifvYc7ptiWEuVNiu+fmYwKfbbrrylcmexQUBAqAhTL3uhy074TQorEXygdLgxq
6KwvX4g4T5olScwzU6oT7sGS58joEMJw7yF3NBFhrUHdVZNqgYz1bgzRp/MDDRDa
kqtenNjSL4LtYF5MdvUSsS1Jq1tlYqkB9hbqKcE9MbjXwBWC+8WaNj11NQJllfVw
3QQDGO1sCnHmlBbPUYBarRv1MVicus4U2V1X6Pph70LqT6RcekqL8ilW0t6ePYDq
LRkDx9WkPKk3binX+Ujyuld4MAQnCwzbgGh8j9sT2yRrht8UzMa9a9pK+Hru8Zo=
=fikF
-----END PGP SIGNATURE-----
