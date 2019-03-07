Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FHSx2DHGzDqC5
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 15:19:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 6 Mar 2019 23:19:41 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Tony Lee =?utf-8?B?KOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: How to upload proposal and code for specifying and customizing
 projects?
Message-ID: <20190307041941.22vujoizv5prib57@thinkpad>
References: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 07 Mar 2019 04:19:14 -0000

On Tue, Mar 05, 2019 at 07:05:59AM +0000, Tony Lee (=E6=9D=8E=E6=96=87=E5=
=AF=8C) wrote:
>Hi Brad,
>
>I have two new packages "phosphor-nvme"=20

Is this package already written?  Would you mind filling out a design
template for it?

https://github.com/openbmc/docs/blob/master/designs/design-template.md

> and "quanta-dbus-interfaces" for specifying and customizing projects.
>There was a service pooling status of NVMe devices in " phosphor-nvme "
>and several d-bus interfaces for Quanta in "quanta-dbus-interfaces".
>
>1. Is it will be put into a new repository or put it under the meta-quan=
ta?
>2. As for the proposal, is it still need to commit to gerrit under openb=
mc/docs ?

I can certainly create a quanta-dbus-interfaces repository if you'd
like.  But first - I'm just curious abouut what sorts of DBus APIs you
have?  Are they actually specific to Quanta machines, or could they be
put in phosphor-dbus-interfaces? =20

Do the applications that implement the APIs in quanta-dbus-interfaces
already exist or are you planning on writing them in the future?

Could you briefly talk about what some of the applications that
present/would present these APIs do?

thx - brad
