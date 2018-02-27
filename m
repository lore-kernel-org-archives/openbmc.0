Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="RqD//kJh"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dzzzuvS2"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zr2hx3tjTzF1Jy
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 13:29:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 81B7320F06;
 Mon, 26 Feb 2018 21:29:46 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Mon, 26 Feb 2018 21:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xM643W
 NKWSaIbUnmm0GQUv+/mPdLFBystOV8V6dxBKA=; b=RqD//kJhPniNGWHTZx2LPZ
 Wq84w6mPEB2DXQAS1sQN1BXtFektL3yetx76lfdPoknF0/oIlD2hG8lmgJUMeA60
 WDQNPJCtF6No/XuF5/Gcrj+e8mL5CtmQ8wxZxltHBVzZ4FUKLrqw0iT+uCS3I4PW
 X9QlikB9IKZNaqvvQoVDdopZGdVzrNjAMOqbucEzRJEjRVSr2TaR/VmljpekinST
 Exq3M47HBU5u4qr3G2A0dyZH3POpIL1S6m791y7k9cqEzb5On2sUjygMhJGvO0NV
 KLPoTa2vVaCT+n/OWhCQ1IeALC2xVM2v9B+DVedUP47mblaNAuPufFxso5JV4tcQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xM643W
 NKWSaIbUnmm0GQUv+/mPdLFBystOV8V6dxBKA=; b=dzzzuvS2gq/ef9XEEsQFkt
 vAYr3R9RKx/AQvgEPrGbV9T8hVYvZSqmAevHqQSDHvG8lfyUp6B0Qst10k2qkTi/
 7NHaCyN0kjkg7s2b9FdVeYWeLygTioPhZ7WdTmGxOsQuXQxoN5O2bQEW5e8YQ5U+
 ZrT6d3/zJ7mw94Vgbro8XF8EayFZNeMG5AuaSKG/QiFulFvyXcUnwsrlqzlmMMWt
 ZVAGRemylx8BuNM8EHfXVoka7pER2AQMtIgHBBDSGKNzICxB8eLFnNKGGNaLwc5E
 7AvjvgmZyyysDdAATF5x4IxJEUSXKFoAU/3lPgc+3skxeQccvvJe57NcWR9p97fQ
 ==
X-ME-Sender: <xms:msKUWsH9YCsgpDfkW4myhC2jfVUdnPsXw9DW4jlZDammt4xOlHWZGw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEC61244F9;
 Mon, 26 Feb 2018 21:29:44 -0500 (EST)
Message-ID: <1519698581.7888.2.camel@mendozajonas.com>
Subject: Re: [PATCH net-next] net/ncsi: Add generic netlink family
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
Date: Tue, 27 Feb 2018 13:29:41 +1100
In-Reply-To: <20180226.113136.1568195044048732904.davem@davemloft.net>
References: <20180223041518.20195-1-sam@mendozajonas.com>
 <20180226.113136.1568195044048732904.davem@davemloft.net>
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
X-List-Received-Date: Tue, 27 Feb 2018 02:29:55 -0000

On Mon, 2018-02-26 at 11:31 -0500, David Miller wrote:
> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Date: Fri, 23 Feb 2018 15:15:18 +1100
> 
> > + * @NCSI_CMD_SET_INTERFACE: set preferred package and channel combination.
> > + *   Requires NCSI_ATTR_IFINDEX and the preferred NCSI_ATTR_PACKAGE_ID and
> > + *   optionally the preferred NCSI_ATTR_CHANNEL_ID. If neither IDs are
> > + *   specified the setting is cleared.
> 
> I think clearing the setting when the required attributes are missing
> is dangerous behavior.
> 
> It is ambiguous whether the user intended the setting to be cleared,
> or was in error and forgot to supply the attribute due to a bug.

Fair point - I'll change this to be an error and add a separate command
to clear the setting explicitly.
In that vein is having NCSI_ATTR_CHANNEL_ID as an optional parameter
ambiguous enough to justify a separate command as well?

Regards,
Sam
