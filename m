Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iIqR6n0c"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydpd02sRzzDrRj
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:50:43 +1100 (AEDT)
Received: by mail-it0-x22f.google.com with SMTP id u132so5387162ita.0
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PvMHe/OBklmJHeEyOYARvdDxWmlu9NJSsi4Syhb3pHY=;
 b=iIqR6n0cXvhk/HFeSr1i/n+iPFKg3Noi9ppQRC2PTxWIgeIOmSrquxSGq37UthoHpR
 Z0zAtGkQVALyKES79+EF/1xS09gBFO4C8aU37Ry0/0jcYNuW6TVa9w/gh4zeFcGyfGNf
 OEsdhkirLBzVMFvXbsNjebGqsCI/HkEB/C1BoRsoZBNprzrauiWb9+DgyFb6TVxoszn/
 XPPKbO3JdOVR1QEUo62QRqzLXtEZapcvHXmZTxHvDLdgEOsTKIYPG8B98DuouOtEH4kv
 5lolVIr6fFJByVsNl8p5rTAdTONAg8K4aO34Xzdww/QGodaj8wGrW3o452zDlC+zapfe
 RWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PvMHe/OBklmJHeEyOYARvdDxWmlu9NJSsi4Syhb3pHY=;
 b=Rgu/shb5B7bRq6Bw74NfwaWmJs7et+IijYZuvxvotQMxH9CfIveNgtrtMCDWeaNylw
 bz4oKK+PZoNHrLZD5qIFFwZ0CZJMVz70cSwgg+4lJjB0OFGsPbkmm8fAwOFAJULiI5eR
 V+0yDQMksBDBCEJMvkBHb+phjl2Gmx9igyom2vXjHXonEGlJK4TDbsIB7oUcF8efEshz
 ojscAqNPvanXU1Tqo7OMKAinWYs14KUkKXlQtO3bBg3LLKS8Nus/biHz/IZX16cE6KVo
 VoYZLDeZi0KxQRNpYRDSy3qNiTIL6u2iYnheH02FqtgGHt8Po+1wyYzuLEKBbYJNQiG7
 vhRw==
X-Gm-Message-State: AJaThX7ZjIY/2lgGpd08PeYxB62cdr4ZKLBhosJ3PN6tuKNkzCHhJF21
 ncTMuWWlhUQHWu2iUIFWSuKVUcfbJQ6hQn2Ntmi4Sw==
X-Google-Smtp-Source: AGs4zMacqO8A4OIiIvBsoucWfOIen8TGAfSEImUwmX/E43YaGBZ44snVRmQomKYt0TrKusbdn6kmYBVHdEOn5h2DSoA=
X-Received: by 10.36.94.129 with SMTP id h123mr4048785itb.64.1510948241273;
 Fri, 17 Nov 2017 11:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.32.5 with HTTP; Fri, 17 Nov 2017 11:50:40 -0800 (PST)
In-Reply-To: <FAF06F84-ACA5-444E-A4CA-56FF6EE950B8@fuzziesquirrel.com>
References: <FAF06F84-ACA5-444E-A4CA-56FF6EE950B8@fuzziesquirrel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 17 Nov 2017 13:50:40 -0600
Message-ID: <CALLMt=rsA+sYdePC6Jmj9yFwJokj3njYzXAGxZueAQ_=Kfv=qA@mail.gmail.com>
Subject: Re: OpenBMC community telecon - 11/13 call for topics
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 19:50:45 -0000

On Fri, Nov 17, 2017 at 1:29 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Please reply with any topics for the 11/20 call.
>
> Monday, 10:00pm EDT
> 888-426-6840
> password: 85891389
>
> -brad

I think George was going to do a overview of our internal automated
testing at IBM?  That would be a good lead into discussing
https://github.com/openbmc/openbmc/issues/2635#issuecomment-344667854

Hopefully we're going to get some time to focus a bit more on our
DevOps items in the coming sprints so would be interested in the
communities feedback on areas to focus.

Andrew
