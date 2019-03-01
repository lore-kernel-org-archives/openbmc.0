Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="FkZwA39I"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IgR+smYM"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449Wm24W4tzDqB5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 12:19:13 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 4276E274F9;
 Thu, 28 Feb 2019 20:19:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Feb 2019 20:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=XUm2fInwCCIE2KkVvFTOtzLtsI
 m1TCTkp3BmcvtpAXk=; b=FkZwA39Ibd+pFvsqy+0jopQQcb5EoFCH2PQgBGwiXi
 uOKrS9BzYD84vVmd6thME4jRhDNxcijQvxHeno+9mGVhVqccZGWXtrC4Kf4NBRuw
 s5Kkdms7EyExloK6Co0dJsrNKATeKaO2WvsEt/nj2vCfXBICSNmsLlIH7Nf7HAkW
 jrGosawrW8sbs4D3DNDsQ0MNTN1wk2j2WSPeUfvl4f84iLJLUpX05uA0Tzk8GLwr
 XCnVHjM2aLakWBt+92vWxLlW05uYEohELecd6cxN4GOs16UfkC0Xf6u2tfQAiyjF
 7n3SUy20HYwlNn64JO74jE+2Hd+VDMN1/cT1b3ClGonA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=XUm2fInwCCIE2KkVvFTOtzLtsIm1TCTkp3BmcvtpA
 Xk=; b=IgR+smYMT9zv9oP+AaGJuzXKAfG92is9WPhYSY/n/qS2ELrB0IQAp+emg
 Q/26DTyYdbnSUw5FwNgzi06lZLqNPZPS2Xy+pydybgB1EeBmGl2IHqGH49D6riY6
 Qk1zT/kSyJkiegT9HZaSWSxapH647YYyCGmmKFDt1evE4S+TfZJXHQ6CLeqCkHd7
 zQYv3sS+fsXvmIFYC2BM4gW3j4VCX7R3Vp7UDY0AUHB6ojwAUao2zK2hcRuX7lr0
 PDbOEyx4YeLd4ZjLF0qmzyNhdZZk5gf3CXLX5hfqRD2yu8AlJc15MogyXkp6C4yW
 G989U+jbC7bujjQNNQiClfegrqngQ==
X-ME-Sender: <xms:jYh4XOJwPIA-qo7YVQoxED9rTyzwM5XZGEb2fVzzYvcy3AHd55CO6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvdeggdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmh
 gvnhguohiirghjohhnrghsrdgtohhmqeenucffohhmrghinhepohhpvghnsghmtgdqphhr
 ohhjvggtthdrgiihiienucfkphepuddvuddrleelrddufeehrddvudeinecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdrtghomhenucevlhhu
 shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jYh4XNQiHCEYjNDc-AWJxX1qJcCsbMrIUUfKP8a_vevjdD1SZRpAFA>
 <xmx:jYh4XBAjTReDeyKcx3Oz2c1QmsFl5iuMZvTwazfD7fF5WXA6l4fYcg>
 <xmx:jYh4XMLwWQVKLI8F3H6_hZJAtLg0_oPNU7fnBQnILKp7v7JYS3RWgg>
 <xmx:joh4XNMKZP1IcCTRBjrW3pwtr4S8qsU_r8JcB6kcF4dBefkx8ElQPw>
Received: from v4 (unknown [121.99.135.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 854C910318;
 Thu, 28 Feb 2019 20:19:07 -0500 (EST)
Message-ID: <6da2e0e6f04ed7bb152db5008137680fc761ed42.camel@mendozajonas.com>
Subject: Re: Static layout PNOR support in openpower-pnor-code-mgmt
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Stewart Smith <stewart@linux.ibm.com>, Lei YU <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>
Date: Fri, 01 Mar 2019 14:19:05 +1300
In-Reply-To: <877edjsazm.fsf@linux.vnet.ibm.com>
References: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
 <877edjsazm.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 01 Mar 2019 01:19:18 -0000

On Fri, 2019-03-01 at 11:18 +1100, Stewart Smith wrote:
> Lei YU <mine260309@gmail.com> writes:
> > As a follow up of [VPNOR discussion][1], the static layout PNOR
> > support in openpower-pnor-code-mgmt is implemented and pushed to gerrit
> > starting from https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18747/
> > 
> > Code reviews and tests are welcome.
> > 
> > To test the feature:
> > 1. Pick the above gerrit commits and build with --disable-ubifs_layout
> > 2. Generate pnor in static.tar.gz format, by below command:
> >     ./generate-squashfs <xxx.pnor>   # xxx.pnor.static.tar.gz will be
> > generated
> 
> Is this a new format? Why? Where is it documented?
> 

Looking on gerrit this just appears to be the PNOR and a MANIFEST file in
a tarball. Considering it's just a call to 'tar', having it be generated
by something called 'generate-squashfs' is confusing. I guess this is
because generate-squashfs creates the MANIFEST file?
