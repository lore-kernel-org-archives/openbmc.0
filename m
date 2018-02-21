Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="rdCnKt+A"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OTlgh3zg"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmRWy1WDPzF0lb
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 16:54:37 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3FF6620BC7;
 Wed, 21 Feb 2018 00:54:35 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Wed, 21 Feb 2018 00:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=53ShsL
 Z+Gdb3RCb//M6NAaXznV8ohQ2Ni8NrpGztnzs=; b=rdCnKt+AzFEbKaeLDEMzrg
 3+BhmuxN+A3/vtBd45fmoyn/N1OS43FGy2dC5eidpfPAaRLq/nUaKF19xgzUNxO+
 zVtg4qE/JLLUQxef9PybiAXTVMmbgwqTgUyczwra+dr8i7Zjn42JfUPlTxCjw4Lh
 eqFC0HEx2kqckK/puHp92peBXB4bENcGmY9cvzWoifdqhUizfzUq2AoWMaHRFq0q
 +2hjHTGgHW0h5LJsoC9Hau2u6drosfNNkww7eWhgEU4osyhMHU9v+PiawCuKsllN
 owzf2fKgt26oGkLvZtlaMGXpy9uDvya9KYZn0rFpX/m9bOMNQuJbET3NZSvVAODw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=53ShsL
 Z+Gdb3RCb//M6NAaXznV8ohQ2Ni8NrpGztnzs=; b=OTlgh3zgEYBxn04Q5O+lBQ
 ol7jowHpZA2pISV5wosPOErSPaDGyg+WO//V7cf9ipPx+TBEYfmzRX4NxZ9Hw0Xf
 J54N/bp00Y7e4pzqCsYvPRwD1PXqUukxDiTq0qBxGnByy5KjiOU28UDYc3vHvjzt
 MkCeq2niUt49l6XXVUJw4HH88cOKu3X5GV6bSDQza33vY9y5ICFUYJ2u6rEjqtDP
 fJY1MhvbAyZJtsctpQeR5lK2T1T9ZWBUH1FKeIjjbY12oTojOELmZUsJYScnj7Jl
 yvv2K8qql+0goAOUyUD1o8X8+ug3CxWEuXVN0Fl0mRbJgCWQoGgXaJ6tImNQAbPw
 ==
X-ME-Sender: <xms:mwmNWmqaS-lxprhdc-7-ookRnR6EilIOIs6n84IgeWNAeCGHY_f6XQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D62DD7E0DA;
 Wed, 21 Feb 2018 00:54:33 -0500 (EST)
Message-ID: <1519192470.3569.1.camel@mendozajonas.com>
Subject: Re: [RFC PATCH] net/ncsi: Add generic netlink family
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>, sdasari@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 21 Feb 2018 16:54:30 +1100
In-Reply-To: <CACPK8XfYRUa4rj-pNhGMq7K3OkXgSsdO+nDBsDKXpZtBZVEbVw@mail.gmail.com>
References: <20180215033057.1766-1-sam@mendozajonas.com>
 <CACPK8XfYRUa4rj-pNhGMq7K3OkXgSsdO+nDBsDKXpZtBZVEbVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 21 Feb 2018 05:54:39 -0000

On Thu, 2018-02-15 at 14:50 +1030, Joel Stanley wrote:
> 
> Would a netlink API mean we would have to write some userspace tools
> to perform this configuration? Do you have any code for that?
> 

And after some cleanups we have https://github.com/sammj/ncsi-netlink

Pretty straightforward piece of python, but it does require python-libnl
on the BMC which Yocto doesn't package by default.

Cheers,
Sam
