Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qYVCTgvq"; 
 dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42TcM21B8tzF3BS
 for <openbmc@lists.ozlabs.org>; Tue,  9 Oct 2018 10:41:16 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id y10-v6so15148018lfj.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Oct 2018 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DvA1dIgO/iLI7HzEuWbot8G7+MsbAiz1Cj7F10zf5DU=;
 b=qYVCTgvqfT7HEMwsbEHXea9RaY6ZXasnH9SZNwkHhMkhlxQOnBX1LFANcD/owUJFRG
 o/v1sE6faLQM8M8A2k2vxGaQ0Sc3P+EU/qxeUAAZoHvPKkMVTqA6Y5mfkfzFqKnsu9mV
 2l3oW0PRdnyW9L06wMDtum0lMsBneQWds0ftjsgrwg1pXDgVOxJIzll3iRZv9216s8Zn
 xkErDxA6CGEnpQ0ptmXkVS+QqnyxBpcCjP0SFJ6uEErZ2symJg0aBO0YGe1muSd7BBh+
 zbsgpf/pP5YtSG/GvZCNqkocN8bVpxrklJ7ZCnWkvj0VWCvtEN3ZGkF6a9JXjwcUaZOf
 jxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DvA1dIgO/iLI7HzEuWbot8G7+MsbAiz1Cj7F10zf5DU=;
 b=YQ8y/xm3NZh1rknO5nH+/xAcGqwp8ODGjrM4c2txqdmY5E9BpblIMrXypJf4ymLNg2
 cg8Busoa3jaWWIwMmoeGxgb+/sLnAySJbGaYoSluwgbE74+9X6V2dvOJyH1LeOkm1QsV
 YItOc8rjti6B1OJB7GOTVkSNbTEffAKcYJGaP+x9Ecvfg1IO11etJoWn9EamB3TvMZcq
 3pcidmTuqMXCwvemeTORXU0sFH8effjRT6nbH/cFGy/4usNjUg2MowpKj/dYMLlb40/t
 REfPJpQXgjEs7zcyeEp7vgUNvShQLOxHOGhjcgDmu+NF0T0st6r9QfbUDQObNk0GtP/m
 BW2Q==
X-Gm-Message-State: ABuFfoibiOyMdMATl7s9HeNxFFUHLydFIR0hmmkkQA48k1Ue9cfKhIC4
 zjgkNmaNAi+Uh2Xh7m5jQMACEkTg28eSXhNI3cMofXkCUzw=
X-Google-Smtp-Source: ACcGV63VZfN8NYS4ld6iZQN8kbdSndiXn67K60SFGRD8p35ctCK6sMlurbPZiaxEyUHMh7upxf9MSFF9iOlKoAW0WZg=
X-Received: by 2002:a19:5a8f:: with SMTP id
 y15-v6mr13340802lfk.15.1539042072130; 
 Mon, 08 Oct 2018 16:41:12 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <wak@google.com>
Date: Mon, 8 Oct 2018 16:41:00 -0700
Message-ID: <CAPnigK=mBYZE8Jj2f8K0vBQ51V-AjBxxG224_YPTptDc7HPZEw@mail.gmail.com>
Subject: sdbusplus: Migration from mapbox::variant to std::variant
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 08 Oct 2018 23:41:19 -0000

Now that openbmc c++ projects are moving to c++17, we can finally
consider using std::variant in place of mapbox::variant. My goal with
this transition is to eliminate breakage by performing the migration
in a number of steps, working with all of the projects using
sdbusplus. I'll post updates to the mailing list as we progress
through the stages of this change, so out of tree users are aware of
the changes.

The outline is as follows:
  - Convert all users who hardcoded references to mapbox::variant over
to the sdbusplus::message::variant and sdbusplus::message::variant_ns.
  - Modify the mapbox::variant inside of sdbusplus to provide
interfaces which match
  - Move all users of non-standard mapbox variant interfaces to the
superset provided by our mapbox::variant and std::variant
  - Redirect the sdbusplus::message:variant_ns namespace alias to std.
This will roll all packages over to std::variant.
  - Fix all references in our packages to use std instead of
sdbusplus::message::variant_ns and sdbusplus::message::variant
  - Remove sdbusplus::message::variant_ns and sdbusplus::message_variant

We are currently in the first step of removing all hardcoded uses of
the mapbox::variant.

Best,
William
