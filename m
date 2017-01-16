Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v22jj1MtMzDqlV
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 17:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYhyHIUe"; 
 dkim-atps=neutral
Received: by mail-ot0-x242.google.com with SMTP id 65so5679760otq.2
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 22:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4v7MePQUhcKNtPis4mjjR4vfDNkAlwN6o/OlQbApWao=;
 b=DYhyHIUePHsc8kNHy8CKG4VjRpft5l3URScNtnuNEkypNc9bL1779xrVbTcqYUhOEg
 RpnafOkTaXG6HY6HcBY4GdKE04RF6gZ/tvDgcOP6iRNHme9BvFh2PdCLy7IwQoeqlInV
 u4u4YqkqgfruYbASZjeJnCPubkpXh8g0Qo2LNwba+CotuEXnL7ljusMUZdfEo23MdYWj
 JEQxSA2VOE0J8nv4OeQDaxK5JOdYMVs6wOvu1kAzzx5yVX6aIc2Oq5ZHYEx5LB5P8oSo
 IfV3F1so4DgRTfVKCInpzEpr+he5tSicONEYhAf/mJgabo9dOnq7ENmq39o1iQ6/c8/i
 XfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4v7MePQUhcKNtPis4mjjR4vfDNkAlwN6o/OlQbApWao=;
 b=dUzVc5jQDaw0xETi0QWE3D1P/hOs962YotYhsj+xL7hqKNRE/gfX08cWrYgvP+uFni
 xHAC37HsAcLZ752Xmelqut19+pZezVaXAfxwFV4nRwEbekvwxwZT9guUQKWQ4ejeJO/D
 ozqDlSc21eyoeCN8hFla/07p70mxPaFQYctumfN5T8/ja+dStjt1740zBk9FEqW8gCiE
 eQtpGlD688//yTjjJUuhQ8sAZBf4EXSM3bIBMZKLrcCyzRJY6AhmHtoDAAZ7id8CjRuy
 vjhcpzwBr8ch0LAljdenLm+yVEdDSoxwwQ4PsAA2kbGbFZu6e1g0u8mKDRuqM6egSkqn
 r+tQ==
X-Gm-Message-State: AIkVDXJzZDrd533mM4d2GOUhEspBFRBVdgCuOpWeQahd73rzrEGFWKc449uPkVv/LglyivhqykGcnq+FmBiQ/w==
X-Received: by 10.157.37.99 with SMTP id j32mr15016493otd.223.1484546631329;
 Sun, 15 Jan 2017 22:03:51 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 22:03:30 -0800 (PST)
In-Reply-To: <CACPK8Xd2wjT1QpS+SyP7ubFt2XFSJdwBQ7b-JO-8VG=YrK-FPQ@mail.gmail.com>
References: <20170116053740.15299-1-cyrilbur@gmail.com>
 <CACPK8Xd2wjT1QpS+SyP7ubFt2XFSJdwBQ7b-JO-8VG=YrK-FPQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 17:03:30 +1100
X-Google-Sender-Auth: e7JlC6IcFfooFfnDEip-6FJftIU
Message-ID: <CACPK8Xeu6S7OsgnZZMD-De=X1NNSjKsLU4f=33hf3EYsTtC9Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed-g5: Add mailbox and LPC control
 node
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 16 Jan 2017 06:03:53 -0000

On Mon, Jan 16, 2017 at 4:58 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Mon, Jan 16, 2017 at 4:37 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
>> Both these devices exist on the LPC bus these nodes are children of a
>> new LPC bus node.
>>
>> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
>
> Applied to dev4-.7.

This one didn't compile. I fixed it for you.

Cheers,

Joel
