Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RhONKPnd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DVZKDg7l"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409KmQ6wnZzF296
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 16:47:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 045E42168A;
 Tue, 27 Mar 2018 01:47:47 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 27 Mar 2018 01:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=CaUXknfVoR6uXaDvTf3OhCmos/seC
 HTYoBdWW8VjPcU=; b=RhONKPndL3o7WzmCcZbKiDf5Lni/Hj5VFIZ9LA+Trh4yT
 twF919U3egjG9nAelkSPu3sUiIHoRLNZcKQy/rpaCjyt58/6vmayucDEI7g/IDa+
 zRR40HjCiYCRoeN3RvIk0twLZlbADnq4p4VowK9rUwm9hHN4i3kGq1+asG1eAZtO
 cXN+vVFfXoMc+RFAG8R0FNgInp+sGSYQ0rTb2kQ+7MNcPzaxKFFV9PbcZu5FhjbF
 7AX785UxViex/ITLpsFWCqrAuvK2Dlp1YMwF83IXZR7GBQc905pAfGWfh3d6QVaE
 Zbt3nKDX2yqvIubfeZNReSZl4rFnkIk5ExGVgwTGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CaUXkn
 fVoR6uXaDvTf3OhCmos/seCHTYoBdWW8VjPcU=; b=DVZKDg7lrjRg7clOb/2wmQ
 ut33h8F0+5NSO+W6EwQZALijhsiw2nsuxdJlSCPyO48J7PpCQm39bxuqgNv+rBjj
 6dEGJcE+vIWcGB8KduQstVtUI5Py6ci/57sDmrHkRdKhvkfnuajGU0odQlSRHwzK
 ssss52RW8PuUd+zJzI440Gu/exzh9OW+dEMiEVmQILhvMpe15cCcdeNfBxFQ7xW4
 5u+AvMYllfbIM3mYe1tyTeYi877tLVMNRPu/Wz0AcBZ3nEd0MgEglsRAfppA49IQ
 Qcokf/UQgqxrUlUxm5cm86SF8sjI6zi63GDv9yEvNCSxQW/I4oVS4eac+70Z85xg
 ==
X-ME-Sender: <xms:Atu5WnThFH7ukR3K4MTqc0Iaw2OD0yHY5ilYIIRNcfaZhEhoLtC6TA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B8B6BBA43B; Tue, 27 Mar 2018 01:47:46 -0400 (EDT)
Message-Id: <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
Cc: Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
Date: Tue, 27 Mar 2018 16:17:46 +1030
Subject: Re: Sdbusplus-based Shared Library
In-Reply-To: <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 05:47:53 -0000

On Tue, 20 Mar 2018, at 06:03, Patrick Venture wrote:
> On Mon, Mar 19, 2018 at 11:24 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
> > Have you tried prototyping to see how much space you'll save?  I suspect it won't be a lot for a few reasons.
> >
> > 1. A lot of sdbusplus is template instantiations, and unless we forward declare a number of base template instantiations for use in the shared library, most of the application code will end up in the binary anyway.
> > 2. Sdbus calls into libsystemd, which is already a shared library.
> > 3. The filesystem is already compressed, so I suspect that any duplicated methods that aren't inlined will have the same binary code pattern and get duplicated by the squashfs filesystem.
> >
> > Those are all the reasons why I haven't really looked into it for the dbus stuff;  I can't speak to the timer stuff, but I suspect the wins in size there are going to be small.
> >
> > Normal disclaimer, on this specific library, I haven't prototyped anything, just done back of the napkin guesses, so I could very easily be missing something here.
> >
> 
> So my thinking wasn't about reducing size of the binary but rather
> reducing the toil of maintaining multiple implementations of the same
> code.
> 

I'm on board with this idea. There are a bunch of utility classes defined for RAII that are (were) used in phosphor-mboxd that would be much better off defined in some library where they can be reused.

Has anyone looked at this beyond what's in the thread?

Cheers,

Andrew
