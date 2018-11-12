Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tyMJ6j3pzF3C5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 04:25:32 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <8377f4c2b565e8a4cabbaa028bbf02941b8418ea.camel@fuzziesquirrel.com>
Subject: Re: Should we tag master?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 12 Nov 2018 12:25:28 -0500
In-Reply-To: <674AECB5-F797-477D-B4CA-A7A257310CE8@fuzziesquirrel.com>
References: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
 <CAO=notwRaJcdiD8KnbB_pe3k=v6BFZXGnrEcxBH-29LZ=pGL6A@mail.gmail.com>
 <674AECB5-F797-477D-B4CA-A7A257310CE8@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 12 Nov 2018 17:25:33 -0000

> This was discussed on the community call today.  I=E2=80=99ll start lim=
iting
> meta-phosphor content to fixes only on 11/11 and then I=E2=80=99ll do a=
 v2.4
> tag on 11/16.

Just a reminder that I will only be merging bug fixes in meta-phosphor
this week to prepare for the tag on Friday.

Please test your platforms to make sure they work when we tag.

thx - brad
