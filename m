Return-Path: <dstsai704@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=dstsai704@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sqJdXxX8"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VtYb3xkNzF1F0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 12:24:48 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id v133-v6so3344707pgb.2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 18:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=zVhEFkaqKrY23qJEZiFJAUbxn0kOe2ldTLe/J64pECc=;
 b=sqJdXxX8DX5shYXyPn1tDIPIZ6lUyGYicRH7j2sx9Q01MLIzMPHrVDQ/4teO7w9Diy
 XNA496uUoWf/7A9SRIN6ikhGrvqVjMoawabSVaqR/xnc1GOEtFzfxcrixWKk+O9JYRdW
 r4gyhbX/FX0rmq1HvwdkGZI14L/bs/QVUDpqYmyEY7XEh9sCsTgNXr954j2JD9GbAXBc
 pjtqvWpXtec6ijocwM2jX/BIuzHdfNG2EM0Xmr5F4cL/sR/U3BHK41s/zqnshcME9D8H
 JM65Dr1CaU+AcYiZi3NauL6/2KCz3gInGeBrAkDrZ/lkulOALuGIHbaAMc8HBxRobfl0
 2PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=zVhEFkaqKrY23qJEZiFJAUbxn0kOe2ldTLe/J64pECc=;
 b=lxSCT5WsAUDriGGfHrgpi/hZn/2KqwTSfAMO6ipDwDPqKRNfT1CeX/LqHXI2exr4He
 LLRqDD35D0yJkcwXlxXu/JAi/plnOJq9ub2Jjy8pjWnlaQ3Fk3b4/VCE1GQis1mUFdM4
 RttRCq/nfHNcBWDQUJ0+ehHxsgzhfmxEyqfqmwpR4rNB1Iz+fCS+2yQWDAb3z8K3k0x3
 9qcF/kfbSgkja5w3FdvgtZTFw9z9RtBL0pUlYJtnf/x1r/dkPagbkQaJ1stQINKa/1Xu
 DWFdEyJ+f7cnSb/jBwb3YQI00sm8qT+g/1pbgM/vmX7YAT7DK2D5bwJAj5f45dTZzrWg
 sXmw==
X-Gm-Message-State: ABuFfohlS7QkoUC4oSpEaMoaKZ70/MOHO6Kl1AKPM2sD6zAiqmxu6NRU
 cYF+Kyk93j4NaNa1xUVR1oU=
X-Google-Smtp-Source: ACcGV60FJhzy+4VWvpApYJq28HQl+5FhdJOiZirzjiqIBgoQjCDbe3K/35gVsOUVgdCR6do/TEsa+w==
X-Received: by 2002:a63:fd09:: with SMTP id
 d9-v6mr32450362pgh.164.1539221085813; 
 Wed, 10 Oct 2018 18:24:45 -0700 (PDT)
Received: from CY1PR1201MB1017.namprd12.prod.outlook.com ([132.245.253.157])
 by smtp.gmail.com with ESMTPSA id u36-v6sm61550133pgn.56.2018.10.10.18.24.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Oct 2018 18:24:45 -0700 (PDT)
From: Derek Tsai <dstsai704@gmail.com>
To: Sai Dasari <sdasari@fb.com>, Feng Xie <Feng_Xie2@jabil.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Off-the-shelf platforms for OpenBMC
Thread-Topic: Off-the-shelf platforms for OpenBMC
Thread-Index: ATBDMjY1BphG3IqXyjOq8srmodfYxDYwOTQxxoocKjw=
X-MS-Exchange-MessageSentRepresentingType: 2
Date: Thu, 11 Oct 2018 01:24:43 +0000
Message-ID: <CY1PR1201MB101757941C4699ED973B1328A9E10@CY1PR1201MB1017.namprd12.prod.outlook.com>
References: <BN7PR02MB5300DFB69593AA2DFACE8CBFCAE00@BN7PR02MB5300.namprd02.prod.outlook.com>
 <46997EA1-1B92-420C-9397-6E6D005C8E06@fb.com>
In-Reply-To: <46997EA1-1B92-420C-9397-6E6D005C8E06@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 12 Oct 2018 16:55:50 +1100
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
X-List-Received-Date: Thu, 11 Oct 2018 01:24:52 -0000

SnVzdCBjdXJpb3VzIGlmIGFueW9uZSBoYXMgdHJpZWQgdGhlIFdoaXRlYm94Og0KaHR0cHM6Ly93
d3cuc2VydmVyc2RpcmVjdC5jb20vU2VydmVycy9pZC1SMTU2MC9SMTU2MF8tX1dISVRFQk9YX09Q
RU5fMVVfNF9CYXkNCg0KU2VlbXMgdG8gYmUgYSBiZXR0ZXIgdmFsdWUgdGhhbiBQb3J0d2VsbCdz
IE5lcHR1bmUuDQoNClRoYW5rcywNCkRlcmVrDQoNCu+7v09uIDEwLzEwLzE4LCAxOjUzIFBNLCAi
b3BlbmJtYyBvbiBiZWhhbGYgb2YgU2FpIERhc2FyaSIgPG9wZW5ibWMtYm91bmNlcytkZXJlay50
c2FpPWppbi10c2FpLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBzZGFzYXJpQGZi
LmNvbT4gd3JvdGU6DQoNCiAgICAgICAgDQogICAgICAgICAgICAgIEkgYW0gbmV3IHRvIE9wZW5C
TUMuIEkgd2FudCB0byB0cnkgT3BlbkJNQyBvbiBzb21lIG9mZi10aGUtc2hlbGYgaGFyZHdhcmUg
cGxhdGZvcm1zLiBDYW4gYW55Ym9keSByZWNvbW1lbmQgc29tZSBwcm9kdWN0cyAod2l0aCBkZXZl
bG9wbWVudCB0b29sa2l0cyk/IFRoYW5rcyBpbiBhZHZhbmNlIQ0KICAgIFdlbGNvbWUgRmVuZyB0
byBPcGVuQk1DIGNvbW11bml0eSEgDQogICAgDQogICAgSSB3b3VsZCBzdGFydCB0cnlpbmcgdG8g
Z2V0IGFuIGV2YWx1YXRpb24ga2l0IGJ5IGNvbnRhY3RpbmcgQk1DIFNvQyBWZW5kb3IgZS5nLiBo
dHRwczovL3d3dy5hc3BlZWR0ZWNoLmNvbS9wcm9kdWN0cy5waHA/ZlBhdGg9MjAmcklkPTQ0MA0K
ICAgIElmIHlvdSBwbGFuIHRvIHdvcmsgb24gaG9zdCAoQklPUy9VRUZJKTwtPkJNQyBpbnRlcmFj
dGlvbnMsIHJlY29tbWVuZCBhbm90aGVyIG9mZi10aGUtc2hlbGYgcHJvZHVjdCB0aGF0IGhhcyBD
T01lIGNvbm5lY3RvciB0byBwbHVnLWluIGhvc3QgcHJvY2Vzc29yIGUuZy4gQCBodHRwOi8vcG9y
dHdlbGwuY29tL3NvbHV0aW9ucy9wZGYvUG9ydHdlbGwtTmVwdHVuZS1BbHBoYS1PcGVuQk1DLURl
dmVsb3BtZW50LUtpdC5wZGYNCiAgICAgICAgIA0KICAgIA0KICAgIA0K
