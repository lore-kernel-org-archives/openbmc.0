Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::232; helo=mail-oi0-x232.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E9MFE5ev"; 
 dkim-atps=neutral
Received: from mail-oi0-x232.google.com (mail-oi0-x232.google.com
 [IPv6:2607:f8b0:4003:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41s01W1xXkzDqp5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 07:33:01 +1000 (AEST)
Received: by mail-oi0-x232.google.com with SMTP id d189-v6so10672902oib.6
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=tGu5P14N+ZWceGg9v545MuZuUPwgBAUg5Q7+VTGVTRA=;
 b=E9MFE5evW3DMOiuJRyonQ54fhdCCDUy1tNt2dYSpNeEY+dWgsVeQ397nwR/hunl5cr
 MUOBWbW1TTJq04c0sd6d010GMD4giUI2tw6qHi0WP+KttN1jY4O6RV+AMMBK3UPfd8iZ
 4AMhafB/3mCRzG+MRjM5/pDtFTvY5nu4uiobCFbu4invbAP01LCFf2rssKS7m8MRiKaN
 BBglhwlfiGa0CSPAFImiAKR7yeKEuQ+Fz2+/HF8ixBmX6PZsgDnifS/lBD37Qcs8Pd5r
 mr43W/l4HLioTw9uPucCxE69Jz8LljSEx+Rx9GL6/x+iZkoigCkPn73P39eqvnI7iuzH
 awFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=tGu5P14N+ZWceGg9v545MuZuUPwgBAUg5Q7+VTGVTRA=;
 b=S9n7niIwDu28CnhnfNMJVguHr/jz11ERJAU79nj17rl6kMCVhWyyfNGyH79eQpMbmx
 dysiLzEtnJbTddLWpgfV1VZHeZ0Nk9rYC0JzG5dI4VX5qOGRMl+9d9rWr9yDDxilpvXz
 ikrrUX7dU2QtUhsrJKfUasLdl9/2/HsLftTD/YK4GyjgIxCFLBRAX94E3gXNKq96OBbU
 EsrGBiYliDqU/uOmJ+1cKLgi9PBwqsG1PiGadADZ0k1UahJ7A9uFyOt/wJxsj8Fl7rDl
 eSxsmT/Dqblzs67YacmLEBuSp+/PW9M+9JXJqUkcAb7M5LMRZfg4se2HVigQeVbU4Ivn
 PZMw==
X-Gm-Message-State: AOUpUlFhVyNwE2kAbQMS89e0Rpjh40K6dGxIa0HRAcDE6Oex19X611+x
 QMGqfmRfieLYQqh5wQ/K9G2Nq2Gt
X-Google-Smtp-Source: AA+uWPz3QgOOf4Qz5CKpcLvnexiz46dSHGS3a5rck6XFsETFaatkFLafCJrkC8wdHU5cY+e4QKagUg==
X-Received: by 2002:aca:4c81:: with SMTP id
 z123-v6mr33857133oia.318.1534455179200; 
 Thu, 16 Aug 2018 14:32:59 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id e205-v6sm765388oia.9.2018.08.16.14.32.58
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Aug 2018 14:32:58 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 8/16 OpenBMC Release Planning WG Meeting Minutes
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <30973f41-db72-7564-17eb-9814ae5c00d5@gmail.com>
Date: Thu, 16 Aug 2018 16:32:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 21:33:04 -0000

Lightly attended, but good meeting nonetheless. Thanks everyone, see you 
Monday the 27th!

Meeting Minutes:
https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing

Agenda backlog for next meeting:
https://github.com/openbmc/openbmc/wiki/Release-Planning

Regards,
Kurt Taylor (krtaylor)


8/16/18
=======
Attended (*) Primary company contact
------------------------------------
   Kurt Taylor, IBM (WG lead)
   *Sai Dasari, Facebook
   Kun Yi, Google
   Maury Zipse, IBM
   *Nancy Yuen, Google
   Andrew Geissler, IBM
   Tao Ren, Facebook

Not Attending
-------------
   Brad Bishop, IBM
   *James Mihm, Intel
   *Dick Wilkins, Phoenix
   *Ali Larijani, Microsoft
   Yugi Mani, Microsoft

Review of Agreements from previous meeting (see previous meeting minutes)

*** Reminder: This is the last meeting on Thursday, next meeting is 
August 27th at 3:00pm Central Time (2000 UTC)

Release Content (Design Milestone - Aug 31)
-------------------------------------------
Requirements for these items? Designs in progress? Designs via email? 
Workgroups needed for design?
   Worked through the spreadsheet to try to close items with questions, 
had to table most of them due to low attendance (mainly need Microsoft 
to attend and describe the items they added)
   Worked through the release functionality items with multiple 
contributors, summarized the design state and the need for a design document
   Action for next week are to re-engage design discussions that were in 
email, get contributors together to consider filling in the design 
template - maybe in a Google doc, until ready to push to gerrit in 
docs/designs directory
   Design template - still needs review, changed to Markdown to match 
all other docs
     https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/11906/
