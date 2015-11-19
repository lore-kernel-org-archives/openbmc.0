Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7348B1A0410
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 16:42:57 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 18 Nov 2015 22:42:56 -0700
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 Nov 2015 22:42:55 -0700
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 56F84C90041
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 00:31:04 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAJ5gsOQ53084250
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 05:42:54 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAJ5grtY016306
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 00:42:54 -0500
Received: from oc8180480414.ibm.com ([9.81.199.205])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 tAJ5gf0K015581; Thu, 19 Nov 2015 00:42:52 -0500
Received: by oc8180480414.ibm.com (Postfix, from userid 500)
 id 39702429F; Thu, 19 Nov 2015 16:42:39 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
In-Reply-To: <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
 <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
User-Agent: Notmuch/0.18+16~gec02089 (http://notmuchmail.org) Emacs/23.1.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 19 Nov 2015 16:42:39 +1100
Message-ID: <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15111905-0033-0000-0000-000006E6A8E6
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
X-List-Received-Date: Thu, 19 Nov 2015 05:42:59 -0000

Joel Stanley <joel@jms.id.au> writes:
> On Thu, Nov 19, 2015 at 2:02 PM, Stewart Smith
> <stewart@linux.vnet.ibm.com> wrote:
>> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>>> This switches us over to use autotools rather than custom makefiles.
>>> This brings us into line with the defacto standard for building
>>> userspace.
>>
>> I haven't converted everything yet, and I've really only started to poke
>> at what makes sense for the current structure of everything.
>>
>> There's a magic thing we could use for plugins too, which allows in tree
>> and out of tree, and I haven't started using it.
>> See https://autotools.io/libtool/plugins.html
>>
>> But first I wanted to raise the possibility of autotools and what it
>> kind of looks like.
>>
>> We should also move to explicit exposure of symbols rather than
>> exporting everything.
>>
>> thoughts?
>
> Looks like a good start. Thanks!
>
> There are two things I think we want to look at. You mentioned the
> first; making sure the structure makes sense. This means double
> checking our reasons for the separate git repositories, as well as the
> directory structure within repositories. We want a sensible strucutre
> so the code is easy to understand, to release, maintain as well as
> test and hack on.

There's also the odd thing at the moment for host-ipmid where there's a
shared library that depends on symbols in the binary

> The second is to see what changes we can make to reduce the footprint
> of the distribution. It looks like we're moving to 32MB flash for the
> systems we are using, so that alleviates the problem somewhat, but it
> would be good to make sure we're not bloated for bloat sake.

what can probably help is only exporting symbols we need to, possibly
even building statically rather than dynamically.

Oh, and building with -Os :)
