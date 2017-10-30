Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22b; helo=mail-pg0-x22b.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f2OEVKg+"; 
 dkim-atps=neutral
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQrXG42YczDqwS
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 10:38:37 +1100 (AEDT)
Received: by mail-pg0-x22b.google.com with SMTP id v78so13021145pgb.5
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 16:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=hWcQvaBX3MoUOv/wu+wGi0Wgu0xumBBWlYvFgZUbpxM=;
 b=f2OEVKg+6QN6Hqmu7t2a2KrcYqGYHYuLOS3aefHh6/QBimsnRudCt0cmnkH7LswD5F
 FUAQDsBCzX8mbKJaaGmyvtNm3Q9rHnxwQX6+zYDI0Js1WON+KC9mtI6VfTjmpZHAIvlf
 QTt4ho8IgSksSyceOmVrnlZSjZHQF+WVQDRyJ2MHeBmxvychM2cdxSIo1JUD6fkLJzTW
 +jsUbEHWmK+MAlok9ZvHnwPzQ+/Yrh8l54zAVXFw/sm7yt8Gmxo1kkQMdR08dfEHST0D
 2Tv9WAsWBbXaukptIdTth/CBQ+c5TKs5cQs6d8fP7qavYwEZUA3EagHIh+Yrv5iQ47vG
 0JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=hWcQvaBX3MoUOv/wu+wGi0Wgu0xumBBWlYvFgZUbpxM=;
 b=HvYMLkuO/osU/xDwJrvcIW3kfo7J+nwCD8LS8jinTnMDg9qaZq4xUotJngZUlT0XDz
 Z2VSelxgDJuI8thqNRlIO2kvP2wRix/K3/P7bZpa/JVVykjQFlJ8r46ETYd3cLo203yK
 KX2CWNl2x5PvPIRgiAnPD2RpPVlFPY6d3gyFW8hz7hMHWw+b6HfcLcfgQGjrM4c+14Zg
 FYT06ve16ufnpK9kDjbCDeYFr5TRFtNfLgPeEbeJysO8piLG9nYMfAko93SPEFfJG1N3
 Kb66i49r3F+nT1nf/19d1A1iimYgubQbbk3stNInT/JORdTanH0824leqM4j6n4EVZAl
 23YA==
X-Gm-Message-State: AMCzsaUPsFiT2TKRCbx+uMHlkspSH3nciuesTnVeT4ycb92Q84E+WrI4
 LWaqM7/9Le+QLefTerD361yCHA==
X-Google-Smtp-Source: ABhQp+RuWyoRugk4g2gYcKHLM+PfwHqRsrjqGvDQJ5GUZnh2tHtFDOkKqBNvTP84KrWqyofSrt/4lw==
X-Received: by 10.98.204.157 with SMTP id j29mr29109pfk.236.1509406714426;
 Mon, 30 Oct 2017 16:38:34 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:487d:f99e:2a8:a3f3])
 by smtp.gmail.com with ESMTPSA id x73sm98355pff.102.2017.10.30.16.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Oct 2017 16:38:33 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v9UNcXl5003590; Mon, 30 Oct 2017 16:38:33 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v9UNcWnK003589;
 Mon, 30 Oct 2017 16:38:32 -0700
Date: Mon, 30 Oct 2017 16:38:32 -0700
Message-Id: <201710302338.v9UNcWnK003589@mactruck.svl.corp.google.com>
To: Philip Chidester <Philip.Chidester@flex.com>
Cc: openbmc@lists.ozlabs.org
From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: Open BMC org
In-Reply-To: CO2PR0801MB219720F2F66AB9EBE6E6B0C8FB470@CO2PR0801MB2197.namprd08.prod.outlook.com
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
X-List-Received-Date: Mon, 30 Oct 2017 23:38:39 -0000

> Is there a n Open BMC working group that I can join?

Not sure what you mean by "working group", but this is the right place for any
and all questions. We also have an IRC channel: #openbmc on freenode.net

>
<snip>

You seem new to the list, welcome!
