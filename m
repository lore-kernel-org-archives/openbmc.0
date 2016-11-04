Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96mr0DTRzDt11
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CfuuP9hh"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 62so10303975oif.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5XMMkUxn7ICqZwKDPvOnrRTRk60X/z1/IuS+nN/pp7M=;
 b=CfuuP9hhWGziy4CF1eg6xsZ0iItmSmO8gEODa+huliZ9mHG3xqMy+k38tA4s0I74w5
 cL9kmzSoJTNZfaMNdBTNvgvlisF3/t/zjWUMy0BtQChnMrfXjIdezTV+EhlYDNLTZtlH
 +eWe/hxj6nLVDTmzx4zcH070mWtpSTJus/z0ga8EBHCyAfrrLCbWwgKth5Vg1/UHvE2X
 sL6IginD5PmvUVW4kls0SXftuXHvXGevpgsvoJXpv+tkZg4yywNnuEAnpUpogyeNRDE2
 BXCB2rXFc+BuiM5DEH0CE/aMOYPkn60CWFgY0AKI9UIdB9tF5D13249EAuAFznn8kPo3
 sv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5XMMkUxn7ICqZwKDPvOnrRTRk60X/z1/IuS+nN/pp7M=;
 b=fGPnZ4ymmvI1/JHSxZ+rz7cpihRQU2DWD79Fl9iWr5BwRoLF1I8wTlsAAQHGK66+7I
 rsR199uN8rc5MLQW+qJ23QTb1faZDFNcLtW40tWrb7cLwUb5uZQTj8wiU/QBHlIpMnwy
 4g/QbMcFGiRzMssv5sPZ5rw7vrmXQTPba0C73QFWePHt9xvPq4yXQiyTr7uoSw9fgaFL
 n81IDfVcfWc4uPOpry1WK0dpcsirrn04wahw4s03eEiLuTzDfK/36Z6spgW4EYSFbe9s
 sB279vU3kVyIp48/W6HWF2UZ7M+/sqihDhLc+iuwIVt5Ia28HQUc2V9jAQgM9bn46UYf
 DCLQ==
X-Gm-Message-State: ABUngvfyLwXlbWlLqrx6IOXtVN4ZjbyMd7vNKKDtJJVUoV55o1DKwWGvz5HC+8xYP8VoN4nbKAnIIkD8r/f+rw==
X-Received: by 10.157.41.101 with SMTP id d92mr8878512otb.165.1478230250031;
 Thu, 03 Nov 2016 20:30:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 20:30:29 -0700 (PDT)
In-Reply-To: <1478222081.27396.43.camel@aj.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
 <20161102055557.24349-2-joel@jms.id.au>
 <1478088662.27396.5.camel@aj.id.au>
 <CAPH-5w498pdxsc22+TSMY4u1hEiPmWqrQMa2j6bQzuUsqGkG1A@mail.gmail.com>
 <CACPK8XdWn91bXBgH2CRu=vNKNQWSc6VjhOcJNYcS37F7bC8kgQ@mail.gmail.com>
 <1478222081.27396.43.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 14:00:29 +1030
X-Google-Sender-Auth: SktR_k3QguM_UBRtLPyWqOgqxQ8
Message-ID: <CACPK8Xc2SXeRBmve3GrQTUsq=TwEXO71+1WtUfvkLMv=FdPZxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Fri, 04 Nov 2016 03:30:52 -0000

On Fri, Nov 4, 2016 at 11:44 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Thank you both for the prompt review.
>>
>> Applied to dev-4.7.
>
> Just noting that a this will likely be backed out in favour of Kun Yi's
> patch[1]. That way we can configure it in the devicetree in spite of
> the platform's strapping.

Yup. Unapplied! Wheeee

Cheers,

Joel
