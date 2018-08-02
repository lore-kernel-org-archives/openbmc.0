Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22b; helo=mail-oi0-x22b.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p5cfq8Ov"; 
 dkim-atps=neutral
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hQSw46F8zF2D1
 for <openbmc@lists.ozlabs.org>; Fri,  3 Aug 2018 08:53:36 +1000 (AEST)
Received: by mail-oi0-x22b.google.com with SMTP id b15-v6so6491081oib.10
 for <openbmc@lists.ozlabs.org>; Thu, 02 Aug 2018 15:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=AJb/2V/Xwdc8oRsSfUBGGZ+c9iFD/es3ErHNV8Iaikc=;
 b=p5cfq8Ovdqv3QsFTpkS0ZP40+juHjtB0IdfTqDNKsUCduQY6Mts35Ex4cBqKm5GmKd
 ASa2jyXUia5VHffBMMdFbPAjJlgVInz2J4ygBHNDtCzhWbc3J/QC/EPzPIIKX6zJyQF7
 KtVudMLTLkfxwoHzpDzatfl+SxHMwn2HrmS399W6Bdte63RRmfmMa3w2TeTIRLluBKRi
 e9wlLEpHsyxJcc4Mfiqgcr4imCUcb/4H/9h4l0uZQ0Ejihz7udhEKnpZ0vPAJS6+Of8W
 pfxxvT6oxBQSyFe/iSbomItd8weybuphqTedztf1wD7yCSiPeU6eYPvA1p0rfkNjqdX7
 MKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=AJb/2V/Xwdc8oRsSfUBGGZ+c9iFD/es3ErHNV8Iaikc=;
 b=IGY5rRfP+4G15Dn0icqDcjVGQvFQdDCBz/XU45cj2cVhY+8+T3v3d2SMpICm1t6N+T
 PomRS2FvSSVrjsRWl233XTqudoc3klCdCXnVXCIKvidLyoidbt474kT5LhvjfgVfKDxx
 Li2MdecZLbM7+OhaxpD/WOdI54gbYaiJHrtCIeE53l55tXyVvINIQ4q/qCIXq+ypOVcj
 j/RAD9xOkgdOEtzAuICf4i8g4Gm5ZN5QpdYfCEUyasCpx5PWZeZoMCwv2nBEAIEBzqEM
 0FwttnnW3aY+3cT/mhg3fbRkGeUa+Fm5zu0ItU7rUki6j7+nehEg/Tt8axm56CUl5lY+
 D/7w==
X-Gm-Message-State: AOUpUlGsyhyAKKEbXbhgbH0CDs491PTUa+LJacoosWcEZ+frJkuzum+C
 12UEW/X26Vjoq3jKhGQG90ca8sLatHI=
X-Google-Smtp-Source: AAOMgpfQ2VYZ4A87zmNwSUJAIrk5E0a6qSltKgb5ofRniQoqeLb5TqAJ0zfp6dAzsqm5OsnHE0KhbA==
X-Received: by 2002:a54:4e8b:: with SMTP id
 c11-v6mr720421oiy.187.1533250412740; 
 Thu, 02 Aug 2018 15:53:32 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 5-v6sm1824311oil.50.2018.08.02.15.53.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Aug 2018 15:53:32 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 8/2 OpenBMC Release Planning WG Meeting Minutes
Message-ID: <08bc5941-0291-6944-d102-a7e28b8c1b12@gmail.com>
Date: Thu, 2 Aug 2018 17:53:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------DD02A9124FD0D58748F27DB2"
Content-Language: en-US
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
X-List-Received-Date: Thu, 02 Aug 2018 22:53:37 -0000

This is a multi-part message in MIME format.
--------------DD02A9124FD0D58748F27DB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks everyone - a lightly attended meeting, but we made some good 
progress on work descriptions.

Meeting Minutes:
https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing 
<https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing>

Agenda backlog for next week:
https://github.com/openbmc/openbmc/wiki/Release-Planning 
<https://github.com/openbmc/openbmc/wiki/Release-Planning>

Regards,
Kurt Taylor (krtaylor)


8/2/18

  *

    Note: Meeting call info will hopefully remain constant now forward -
    Kurt has a shiny new webex account

  *

    Attended (*) Primary company contact

      o

        Kurt Taylor, IBM (WG lead)

      o

        Brad Bishop, IBM

      o

        *Sai Dasari, Facebook

      o

        *James Mihm, Intel

      o

        Tao Ren, Facebook (partial)

  *

    Not Attending

      o

        Kun Yi, Google

      o

        Maury Zipse, IBM

      o

        *Nancy Yuen, Google

      o

        *Dick Wilkins, Phoenix

      o

        *Andrew Geissler, IBM

      o

        *Ali Larijani, Microsoft

      o

        Yugi Mani, Microsoft

  *

    Review of Agreements from previous meeting (see previous meeting
    minutes)

  *

    Very lightly attended meeting, several replied conflict meeting or
    travel

  *

    Work items spreadsheet discussion

      o

        Scrub continuing from last week with row SSIF (30)

      o

        Worked through the rest of the spreadsheet, improved descriptions

      o Completed first pass of descriptions/state
      o

        Backlog: Need clarification on some items, possible duplication

  *

    Release Content

      o

        What items are we planning on completing? And who is developing?

          +

            Backlog: Need who is working on what

      o

        What are the requirements for these items?

      o

        Where do we need workgroups forming for design?

      o

        Google docs for high level design, turning into patch sets for
        approval?

          +

            Discussed using a design template, Brad mentioned that he
            was looking at templates, Kurt offered help - basis for
            google docs

  *

    Backlog: Need to move the meeting time

      o

        Monday or Wednesday? Same time?


--------------DD02A9124FD0D58748F27DB2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Thanks everyone - a lightly attended meeting, but we made some good
    progress on work descriptions.<br>
    <br>
    Meeting Minutes:<br>
    <a class="gmail-m_6774135261892209841gmail-moz-txt-link-freetext"
href="https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing"
      target="_blank">https://docs.google.com/<wbr>document/d/<wbr>1yo9lZp56jkwDM1eXJRE8p__<wbr>FqlAjq7qcdIi1W7hAD5Y/edit?usp=<wbr>sharing</a><br>
    <br>
    Agenda backlog for next week:<br>
    <a class="gmail-m_6774135261892209841gmail-moz-txt-link-freetext"
      href="https://github.com/openbmc/openbmc/wiki/Release-Planning"
      target="_blank">https://github.com/openbmc/<wbr>openbmc/wiki/Release-Planning</a><br>
    <br>
    Regards,<br>
    Kurt Taylor (krtaylor)<br>
    <p><br>
    </p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-211a78e0-fccb-4414-10ca-5fd36734b368"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">8/2/18</span></p>
    <ul style="margin-top:0pt;margin-bottom:0pt;">
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Note: Meeting call info will hopefully remain constant now forward - Kurt has a shiny new webex account</span></p></li>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Attended (*) Primary company contact </span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Kurt Taylor, IBM (WG lead)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Brad Bishop, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Sai Dasari, Facebook</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*James Mihm, Intel</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Tao Ren, Facebook (partial)</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Not Attending</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Kun Yi, Google</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Maury Zipse, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Nancy Yuen, Google</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Dick Wilkins, Phoenix</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Andrew Geissler, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Ali Larijani, Microsoft</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Yugi Mani, Microsoft</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Review of Agreements from previous meeting (see previous meeting minutes)</span></p></li>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Very lightly attended meeting, several replied conflict meeting or travel</span></p></li>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Work items spreadsheet discussion</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Scrub continuing from last week with row SSIF (30)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Worked through the rest of the spreadsheet, improved descriptions</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Completed first pass of descriptions/state
</span></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Need clarification on some items, possible duplication</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Release Content</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">What items are we planning on completing? And who is developing?</span></p></li>
        <ul style="margin-top:0pt;margin-bottom:0pt;">
          <li dir="ltr" style="list-style-type:square;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Need who is working on what</span></p></li>
        </ul>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">What are the requirements for these items?</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Where do we need workgroups forming for design?</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Google docs for high level design, turning into patch sets for approval?</span></p></li>
        <ul style="margin-top:0pt;margin-bottom:0pt;">
          <li dir="ltr" style="list-style-type:square;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Discussed using a design template, Brad mentioned that he was looking at templates, Kurt offered help - basis for google docs</span></p></li>
        </ul>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Need to move the meeting time</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Monday or Wednesday? Same time?</span></p></li>
      </ul>
    </ul>
  </body>
</html>

--------------DD02A9124FD0D58748F27DB2--
