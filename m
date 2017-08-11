Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT5zG19VszDr2Q
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 10:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GaeQPmap"; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id u207so14468763ywc.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=y8BdCTHmxzjgk6DRhaLM9qjZ9q4OUF5ovDRylwFyQxA=;
 b=GaeQPmapWQ7kEOY/jKTj/iyk3n+V1xvqinuSfVPpr7qpIATXRgi8RaBqE3/z6ubX8u
 X1/o6gdfl0DfgkAtaFkd0GPIH0uVDrWx1d3j2NDBxsLCF3lNUGIlsp7MLe8athUA/OHA
 5118Gjx7WRUJsesR7KhzEdMl2OYn5hQ9RrsJjl68ovwkMtvkfk7w3GA5ZG01PZZl1bzA
 RNTAv226Jgwgdz/9aDtWzCEpVnS68d7rJ3e7SAcShDQoZ5MEfGHzp39H3FoLO3JgVZnM
 xG7BrlvW2laad/KFa6jkPoBmH7ww3I/LBej+KdFoc8l42c82oyQheg4bt+rfdC7PyXrn
 oo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=y8BdCTHmxzjgk6DRhaLM9qjZ9q4OUF5ovDRylwFyQxA=;
 b=XExiu2nOUOwpMJ0ITJLSTr7DyNdyg19OogOe9Vh58hui+hRCupbv8t/7c/ddsItpnB
 bGnlLYFE2sy8ahRUKbBfB0LJvSHJSA3n7uNohSPDw8WpvVZWmHTHUGITOBUuqRP7gp+x
 +uXbalf4IDjbCTCJLp72mbL3c/vFzr1X8SEQF6LAgbPl4nj/cN54hZT2p9nGcCw7Am/w
 P5fGrTJw08ZXBT10Xoi7MSSLn8nfpI2+ftMm1W3nHpTuGzPqsbE5fc3nhHbbpUCTT38x
 sRSsOuImrwEZXoWyq+1cIn2QxaunQyBtRpZSiy+xG7wCqyVDr4DQNyziec478FIElJMk
 8CPQ==
X-Gm-Message-State: AHYfb5hMsivQceOVphlm2nh3Vg0b5RAbdfLpbvLtE1J/+iespXyx1x/N
 bTrttKGHI/+OQJv1jaU8TY3yefjD4w==
X-Received: by 10.13.193.132 with SMTP id c126mr11482143ywd.13.1502412664021; 
 Thu, 10 Aug 2017 17:51:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 17:50:43 -0700 (PDT)
In-Reply-To: <CAPLgG=kdZt+6Nj0pbME0fAoo2YkdOU1O-W0qdpuQc3-PV0LBrQ@mail.gmail.com>
References: <CALFfRJMyenqRKq=xfhWW2O1UkQE12Xg+n_+4+Cq9HOb5zBbkpw@mail.gmail.com>
 <CAPLgG=kdZt+6Nj0pbME0fAoo2YkdOU1O-W0qdpuQc3-PV0LBrQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2017 10:20:43 +0930
X-Google-Sender-Auth: 5cgjvcr-eB6FtwuKfAZeEmM2qAk
Message-ID: <CACPK8XevL1=HLAXZnm1z3KhHmWhCw1mnkitZX8pF_3KvnjoX_Q@mail.gmail.com>
Subject: Re: Regarding SOL application in openBMC
To: tomjoseph@in.ibm.com, sachin naik <sacnaik@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 11 Aug 2017 00:51:06 -0000

On Fri, Aug 11, 2017 at 9:42 AM, Rick Altherr <raltherr@google.com> wrote:
> I'm not aware of it being implemented. Virtual UART is enabled and
> accessible via obmc-console-client. Certainly reasonable to add SOL. Patches
> welcome.

Oops, my mail client got a bit keen the first time.

We do have ipmi sol implemented. I've found it to be unstable so
there's some work to be done before it could be considered usable.

> Can anybody know how do I enable SOL functionality in openBMC?
> I am using aspeed 2500 eval board.

On the eval board there's no host, so you would need to do some work
to mock it up. It would be a welcome addition to the ast2500-evb
OpenBMC image, as it would allow others to test out the software
stack.

If you're in a position to take this on then let us know. Tom is in
charge of the ipmi stack, so he could give you some tips here.

Cheers,

Joel
