Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVlLC3FHLzDqPK
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 06:01:38 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <8bd419da20bdfad6fc003145b15db3fb6c24e37d.camel@fuzziesquirrel.com>
Subject: Re: Request to create new repo meta-bytedance
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?UTF-8?Q?=E9=83=81=E9=9B=B7?= <yulei.sh@bytedance.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, xuxiaohan@bytedance.com
Date: Mon, 17 Aug 2020 16:01:33 -0400
In-Reply-To: <CAGm54UHBnv6YkFqCGmJE3Jkx_5gTY0ryaUov+kJGMvsb71kacg@mail.gmail.com>
References: <CAGm54UEhd6KH0676mqN3EUmEAtgJ81NPKboZUffmRUFNBaXV1Q@mail.gmail.com>
 <aa24752bc957748c8c241cee4b24402bb8e6fa1a.camel@fuzziesquirrel.com>
 <CAGm54UHBnv6YkFqCGmJE3Jkx_5gTY0ryaUov+kJGMvsb71kacg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 17 Aug 2020 20:01:40 -0000

On Wed, 2020-08-12 at 14:06 +0800, =E9=83=81=E9=9B=B7 wrote:

> A kindly reminder, please help to add meta-bytedance into openbmc as
> subtree, thanks!

I finally did this today:

https://gerrit.openbmc-project.xyz/q/project:openbmc/openbmc+file:meta-by=
tedance

-brad
