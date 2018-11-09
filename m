Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oy5rWNg9"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rvDH6l2GzF3ZL
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 19:57:19 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id n46so967183otb.9
 for <openbmc@lists.ozlabs.org>; Fri, 09 Nov 2018 00:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xAadkfFYrUQ4VS6ymU5GWbVDvy6eIR5/kcdfVA4xpNw=;
 b=oy5rWNg9uE93V4RNUyaUSxOJ82t1NHHZRegROnlPuX3tKptmuXWZJrN/59J1NfGRxJ
 gy38Hf2ANDLEqbtflE3IvrtoF8nwkruuW1IBORjU0W8Bx+YKtwQB9eLDnDid/bNDu66F
 x25+XN2lKxvcf55/3k988yCNZEzVTeA8WMYFPgUFKfBwmikB5pCGgkW210K59S09/etT
 lYo6wZHk9+U4AJQd8xgm8o+R9nCFm0UfnkwzjEV2LmblHFnwBq0b7fQ4bDeC/lgUHnNK
 BQ4lIaPE5b+EZhXpcFYTLE1HDDFEZ2K8CfAv5ZLyxbAJmylX6OLTNweNvpiJJhop1hgv
 8NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAadkfFYrUQ4VS6ymU5GWbVDvy6eIR5/kcdfVA4xpNw=;
 b=t3mwW8kDinOyl2wra9Nc67toVoJ/1t0lFFIei87HZty+seINDjqmZm81VxzknvE7Ia
 JPB4XyIpLt1/YEUsheBASMqm9SQpa7xox4N19fG8gcgXQ4HRF+pvWIGPlvcB92zxIgRL
 VDcJTbD5Ui77IYzhNCMRFlASAbx5E7o93T7LH3SAU0uttVpOdWchNGgqe4Zjqh9HI2c5
 du2nS4kypHdfNW7lbvf+lwRrlbGY6bNYXUByV9VYR8+rNfTuYse6F0053HRr9mU/dGep
 v7H+/2JK+EbZGMwB8L7XHm1gMBzCOXDkRaBhWPCWjGcNw2+8KkXA6gSD+1QAdNmvwYGt
 oENA==
X-Gm-Message-State: AGRZ1gJnkiZEGc3OMz+YcwjRJCIKXCxsiI8pGrC85HbK6V0+w1W/kzjl
 77FNnpD4qqsXB1kSx+n3kS9XDyCGwokEF36T1Tg=
X-Google-Smtp-Source: AJdET5cIY5kCuwYUQK5IFxqzhb08LQsss1AN4O8jLQLP3Rorv8m0lO9x1PIYGFKz2fgMzzlt3km7o+Ry0VEd4oGjiPE=
X-Received: by 2002:a9d:2624:: with SMTP id a33mr1181402otb.186.1541753837743; 
 Fri, 09 Nov 2018 00:57:17 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
 <CAARXrtkZ8AsP7JBJ_caRfuo9bZNXT5cEbYJy8Xz_8bneP3HUzw@mail.gmail.com>
In-Reply-To: <CAARXrtkZ8AsP7JBJ_caRfuo9bZNXT5cEbYJy8Xz_8bneP3HUzw@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 9 Nov 2018 14:26:58 +0530
Message-ID: <CAE33tLGjGmj5c_isgPmh6Xx_6S8E0X5B2b7pkJQ1tz2Ps-P+8w@mail.gmail.com>
Subject: Re: Flashing Image using 'pflash' Tool
To: Yu Lei <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d472a9057a3789e1"
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
X-List-Received-Date: Fri, 09 Nov 2018 08:57:20 -0000

--000000000000d472a9057a3789e1
Content-Type: text/plain; charset="UTF-8"

I tried the command *pflash -b -e -a 0x20100000 -f -p fitImage.bin*

It is showing the following error.





*WARNING: Erase at 0x20100000 for 0x00271e20 isn't erase block
aligned           About to erase 0x20100000..0x20371e20
!
Erasing...
[                                                  ] 0%mtd_erase: IOCTL to
kerntFailed to blocklevel_smart_erase(): 3 *

On Fri, Nov 9, 2018 at 9:22 AM Lei YU <mine260309@gmail.com> wrote:

> On Thu, Nov 8, 2018 at 6:05 PM AKASH G J <akashgj91@gmail.com> wrote:
> >
> > I tried to flash kernel image fitImage.bin to the flash memory address
> 0x20100000 using the following command.
> >
> > root@zaius:/var# pflash -a 0x20100000 -f -p fitImage.bin
> >
> > It exited with following error.
> >
> > About to program "fitImage.bin" at 0x20100000..0x20371e20 !
> > Programming & Verifying...
> > [                                                  ] 0%Flash write error
> 3 for chunk at 0x20100000
> >
> > Please someone help to resolve the problem.
>
> 1. pflash defaults to operate on the PNOR chip. If you want to flash the
> BMC
>    chip, you need "-b" argument.
> 2.To program a flash area, you need to erase before writing, so you need
> "-e"
>    argument.
>
> Putting together, you command should look like:
> pflash -b -e -a 0x20100000 -f -p fitImage.bin
>

--000000000000d472a9057a3789e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5JIHRyaWVkIHRoZSBjb21tYW5kIDxp
PnBmbGFzaCAtYiAtZSAtYSAweDIwMTAwMDAwIC1mIC1wIGZpdEltYWdlLmJpbjwvaT48L2Rpdj48
ZGl2Pjxicj48L2Rpdj5JdCBpcyBzaG93aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3IuPGRpdj48YnI+
PC9kaXY+PGRpdj48aT5XQVJOSU5HOiBFcmFzZSBhdCAweDIwMTAwMDAwIGZvciAweDAwMjcxZTIw
IGlzbiYjMzk7dCBlcmFzZSBibG9jayBhbGlnbmVkwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkFi
b3V0IHRvIGVyYXNlIDB4MjAxMDAwMDAuLjB4MjAzNzFlMjAgIcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxicj5FcmFzaW5nLi4uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5bwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXSAwJW10ZF9lcmFzZTogSU9DVEwgdG8g
a2VybnQ8YnI+RmFpbGVkIHRvIGJsb2NrbGV2ZWxfc21hcnRfZXJhc2UoKTogMyA8L2k+PGJyPjwv
ZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0
ciI+T24gRnJpLCBOb3YgOSwgMjAxOCBhdCA5OjIyIEFNIExlaSBZVSAmbHQ7PGEgaHJlZj0ibWFp
bHRvOm1pbmUyNjAzMDlAZ21haWwuY29tIj5taW5lMjYwMzA5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdy
b3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJn
aW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4
Ij5PbiBUaHUsIE5vdiA4LCAyMDE4IGF0IDY6MDUgUE0gQUtBU0ggRyBKICZsdDs8YSBocmVmPSJt
YWlsdG86YWthc2hnajkxQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFrYXNoZ2o5MUBnbWFp
bC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBJIHRyaWVkIHRvIGZsYXNo
IGtlcm5lbCBpbWFnZSBmaXRJbWFnZS5iaW4gdG8gdGhlIGZsYXNoIG1lbW9yeSBhZGRyZXNzIDB4
MjAxMDAwMDAgdXNpbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kLjxicj4NCiZndDs8YnI+DQomZ3Q7
IHJvb3RAemFpdXM6L3ZhciMgcGZsYXNoIC1hIDB4MjAxMDAwMDAgLWYgLXAgZml0SW1hZ2UuYmlu
PGJyPg0KJmd0Ozxicj4NCiZndDsgSXQgZXhpdGVkIHdpdGggZm9sbG93aW5nIGVycm9yLjxicj4N
CiZndDs8YnI+DQomZ3Q7IEFib3V0IHRvIHByb2dyYW0gJnF1b3Q7Zml0SW1hZ2UuYmluJnF1b3Q7
IGF0IDB4MjAxMDAwMDAuLjB4MjAzNzFlMjAgITxicj4NCiZndDsgUHJvZ3JhbW1pbmcgJmFtcDsg
VmVyaWZ5aW5nLi4uPGJyPg0KJmd0OyBbwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXSAwJUZsYXNoIHdyaXRl
IGVycm9yIDMgZm9yIGNodW5rIGF0IDB4MjAxMDAwMDA8YnI+DQomZ3Q7PGJyPg0KJmd0OyBQbGVh
c2Ugc29tZW9uZSBoZWxwIHRvIHJlc29sdmUgdGhlIHByb2JsZW0uPGJyPg0KPGJyPg0KMS4gcGZs
YXNoIGRlZmF1bHRzIHRvIG9wZXJhdGUgb24gdGhlIFBOT1IgY2hpcC4gSWYgeW91IHdhbnQgdG8g
Zmxhc2ggdGhlIEJNQzxicj4NCsKgIMKgY2hpcCwgeW91IG5lZWQgJnF1b3Q7LWImcXVvdDsgYXJn
dW1lbnQuPGJyPg0KMi5UbyBwcm9ncmFtIGEgZmxhc2ggYXJlYSwgeW91IG5lZWQgdG8gZXJhc2Ug
YmVmb3JlIHdyaXRpbmcsIHNvIHlvdSBuZWVkICZxdW90Oy1lJnF1b3Q7PGJyPg0KwqAgwqBhcmd1
bWVudC48YnI+DQo8YnI+DQpQdXR0aW5nIHRvZ2V0aGVyLCB5b3UgY29tbWFuZCBzaG91bGQgbG9v
ayBsaWtlOjxicj4NCnBmbGFzaCAtYiAtZSAtYSAweDIwMTAwMDAwIC1mIC1wIGZpdEltYWdlLmJp
bjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj4NCg==
--000000000000d472a9057a3789e1--
