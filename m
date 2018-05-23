Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::233; helo=mail-qt0-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rTBKPHkQ"; 
 dkim-atps=neutral
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rgKr1msMzF14f
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 04:00:47 +1000 (AEST)
Received: by mail-qt0-x233.google.com with SMTP id h2-v6so29248240qtp.7
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=c3J7aRd+0gjJV+Mvelx2Way8nAqUqNjPOcrBLIDWOfQ=;
 b=rTBKPHkQaXOenolMCFNI2nuYkGg+zp5vMTwml4N8Ao7AscbKgY1zk0+yDd0DDCSdr/
 MaqFovxaHyeJc6VmwOdg2y+8zlrwc3AztHJQpxblvQS733ph1NID0KmS1BL9TmeXQSa2
 DH3FDoNHAO/LS25SQ8lpcHlgofrj9kFUM22AAwOGk+fh7MLPTKD/Wf/k+/GXl4Xoepsw
 JlG0LWfN+QBJJVlsnvuCtGJpDOQNd0dD8wjOmgFSkR3i0KNifOYlO0vN1m1nQeI2nh8o
 mN03kBYK6E9EWGlaTYxyim70w/LAjdpFPlAuf1TCYKyhbh+H/zieyGKqKnwSGYlu8JV3
 HPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=c3J7aRd+0gjJV+Mvelx2Way8nAqUqNjPOcrBLIDWOfQ=;
 b=LNj4+KaykNxt0LCoAFBNxljTYw6g4rEV9zIZPQ6cpvpvIceT/fzJcSaYR6Ta4vr/rb
 RKjt/V1TXRYh0P5opy7DYy5bxwlWOdEVCPAeDt5J6C79SYTwx5vws2oRRRRiGXnUoNNH
 zWpdNdlnyzq3xRwWL91peG6SDqvsCVfMwrNvM8u03ytDY2lLaSckCjw3f7hhevMzXaLb
 fyeLUI1bKQsiIo4ENEucls4muVbjW7XYL7G0CZ28doLaCvH332VBynCgyhmLWS383tuB
 KvX8yBydFrFDFheY5p9oAL6n8l2hJ+mWF/vNUGAvhmmmZ3i50xjOx6Kp21WdSppsCLSp
 h4VA==
X-Gm-Message-State: ALKqPwcaUG0LmNo4zfaAqUfI5stzuI6O3f4ecLM7LlfTSfLKlP0oLRcF
 aw0bgeLZU/A/TAub7ObEArBn3gDl
X-Google-Smtp-Source: ADUXVKJaAsG7/L6rTENY2qypCSnYr/h8RhmyS4ixKFGQnexHfKVleTF1YnxYAnM1IsxvYpHt+A0FnQ==
X-Received: by 2002:ac8:96a:: with SMTP id
 z39-v6mr1148986qth.106.1527098443898; 
 Wed, 23 May 2018 11:00:43 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local ([2620:1f7:8b5:284e::32:be])
 by smtp.gmail.com with ESMTPSA id i187-v6sm13397927qkf.39.2018.05.23.11.00.42
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 11:00:43 -0700 (PDT)
Subject: Fwd: New Redfish Schema, Specification and Developer Resources Now
 Available
References: <917816ca36a7bf14f25723323.4c4c04a315.20180523174300.48317526ed.2a327cf5@mail79.suw15.mcsv.net>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
X-Forwarded-Message-Id: <917816ca36a7bf14f25723323.4c4c04a315.20180523174300.48317526ed.2a327cf5@mail79.suw15.mcsv.net>
Message-ID: <0196501e-6087-9f68-d8a2-665850fb838e@gmail.com>
Date: Wed, 23 May 2018 13:00:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <917816ca36a7bf14f25723323.4c4c04a315.20180523174300.48317526ed.2a327cf5@mail79.suw15.mcsv.net>
Content-Type: multipart/alternative;
 boundary="------------D47F2CDF5D06486C1B7C6A98"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 18:00:49 -0000

This is a multi-part message in MIME format.
--------------D47F2CDF5D06486C1B7C6A98
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

FYI, new Redfish items.

Kurt Taylor (krtaylor)

-------- Forwarded Message --------
Subject: 	New Redfish Schema, Specification and Developer Resources Now 
Available
Date: 	Wed, 23 May 2018 17:43:12 +0000
From: 	DMTF <news@dmtf.org>
Reply-To: 	DMTF <news@dmtf.org>
To: 	kurt.r.taylor@gmail.com



New Redfish Schema, Specification and Developer Resources Now Available
Get the latest news from DMTF!

View this email in your browser 
<https://mailchi.mp/605a2ddf1002/new-redfish-schema-specification-and-developer-resources-now-available-1198185?e=4c4c04a315> 



  New Redfish Schema, Specification and Developer Resources Now Available

With the aggressive development of its Redfish^® 
<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=44d86c7af6&e=4c4c04a315> standard, 
DMTF continues to address customer use cases and technology in converged 
IT infrastructure management. An API designed to deliver simple and 
secure management for hybrid IT and the Software Defined Data Center 
(SDDC), new versions of the Redfish schema and specification, as well as 
additional developer resources, are now available.

New items just released include:

  * *2018.1 Redfish Schema Bundle
    <https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=ce75a26427&e=4c4c04a315>
    *– a .zip file that contains the current versions of all Redfish
    schema, including a new ExternalAccountProvider schema for
    LDAP/ActiveDirectory support. Additional schema updates enable
    support for Server Sent-Eventing (SSE), provide additional
    information for Processors and Settings, and more.
  * *Redfish Specification v1.5.0
    <https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=248be50edf&e=4c4c04a315>* – adds
    new support for SSE, enabling the streaming of events to web-based
    GUIs and other clients. Other specification updates in this release
    include a mechanism for specifying deterministic behavior for the
    application of Create, Delete or Action (POST) operations.
  * *Redfish Resource and Schema Guide
    <https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=250db000f5&e=4c4c04a315>
    *– new for 2018, this human-readable guide to the Redfish Schema is
    designed to help educate users of Redfish. Application developers
    and DevOps personnel creating client-side software to communicate
    with a Redfish service, as well as other consumers of the API, will
    benefit from the explanations in this resource.
  * *Redfish 2018.1 Overview
    <https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=6a78b9d068&e=4c4c04a315>
    *– provides detailed descriptions of each revision in the latest
    version of the Redfish Schema and Specification.
  * *Redfish History – April 2018
    <https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=9019ba1b8e&e=4c4c04a315>
    *– updated with each new release, this presentation offers a
    comprehensive view of each revision to Redfish since 2016.

In addition to these new releases, the DMTF has improved and expanded 
the popular Redfish Developer Hub 
<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=68f0f3e179&e=4c4c04a315>, a 
one-stop, in-depth technical resource that provides all the files, 
tools, community support, tutorials and other advanced education 
developers may need to help use Redfish. Revamped with additional 
content and an improved navigation, the website’s intuitive design 
offers visitors faster access to new materials.

To learn more about Redfish, click here 
<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=260a4c97f9&e=4c4c04a315> or 
- for developers - visit the Redfish Developer Hub 
<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=e9b009858e&e=4c4c04a315> today. 
Technical work on the Redfish standard takes place in the DMTF’s Redfish 
Forum 
<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=3b2b07a0d7&e=4c4c04a315> (the 
group formerly known as the Scalable Platforms Management Forum).

<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=2fc377bc6e&e=4c4c04a315> 


<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=bdc1d03f3c&e=4c4c04a315> 


<https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&id=f18fd3af01&e=4c4c04a315> 



/Copyright © 2018 DMTF, Inc All rights reserved./
1001 SW 5th Avenue, #1100
Portland, OR 97204

Want to change how you receive these emails?
You can update your preferences 
<https://dmtf.us12.list-manage.com/profile?u=917816ca36a7bf14f25723323&id=0f342f56d6&e=4c4c04a315> 
or unsubscribe from this list 
<https://dmtf.us12.list-manage.com/unsubscribe?u=917816ca36a7bf14f25723323&id=0f342f56d6&e=4c4c04a315&c=48317526ed> 



--------------D47F2CDF5D06486C1B7C6A98
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>FYI, new Redfish items.<br>
    </p>
    <div class="moz-forward-container">Kurt Taylor (krtaylor)<br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" border="0" cellspacing="0"
        cellpadding="0">
        <tbody>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Subject:
            </th>
            <td>New Redfish Schema, Specification and Developer
              Resources Now Available</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Date: </th>
            <td>Wed, 23 May 2018 17:43:12 +0000</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">From: </th>
            <td>DMTF <a class="moz-txt-link-rfc2396E" href="mailto:news@dmtf.org">&lt;news@dmtf.org&gt;</a></td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Reply-To:
            </th>
            <td>DMTF <a class="moz-txt-link-rfc2396E" href="mailto:news@dmtf.org">&lt;news@dmtf.org&gt;</a></td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:kurt.r.taylor@gmail.com">kurt.r.taylor@gmail.com</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <!-- NAME: 1 COLUMN -->
      <!--[if gte mso 15]>
		<xml>
			<o:OfficeDocumentSettings>
			<o:AllowPNG/>
			<o:PixelsPerInch>96</o:PixelsPerInch>
			</o:OfficeDocumentSettings>
		</xml>
		<![endif]-->
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width,
        initial-scale=1">
      <title>New Redfish Schema, Specification and Developer Resources
        Now Available</title>
      <style type="text/css">
		p{
			margin:10px 0;
			padding:0;
		}
		table{
			border-collapse:collapse;
		}
		h1,h2,h3,h4,h5,h6{
			display:block;
			margin:0;
			padding:0;
		}
		img,a img{
			border:0;
			height:auto;
			outline:none;
			text-decoration:none;
		}
		body,#bodyTable,#bodyCell{
			height:100%;
			margin:0;
			padding:0;
			width:100%;
		}
		.mcnPreviewText{
			display:none !important;
		}
		#outlook a{
			padding:0;
		}
		img{
			-ms-interpolation-mode:bicubic;
		}
		table{
			mso-table-lspace:0pt;
			mso-table-rspace:0pt;
		}
		.ReadMsgBody{
			width:100%;
		}
		.ExternalClass{
			width:100%;
		}
		p,a,li,td,blockquote{
			mso-line-height-rule:exactly;
		}
		a[href^=tel],a[href^=sms]{
			color:inherit;
			cursor:default;
			text-decoration:none;
		}
		p,a,li,td,body,table,blockquote{
			-ms-text-size-adjust:100%;
			-webkit-text-size-adjust:100%;
		}
		.ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,.ExternalClass span,.ExternalClass font{
			line-height:100%;
		}
		a[x-apple-data-detectors]{
			color:inherit !important;
			text-decoration:none !important;
			font-size:inherit !important;
			font-family:inherit !important;
			font-weight:inherit !important;
			line-height:inherit !important;
		}
		#bodyCell{
			padding:10px;
		}
		.templateContainer{
			max-width:600px !important;
		}
		a.mcnButton{
			display:block;
		}
		.mcnImage,.mcnRetinaImage{
			vertical-align:bottom;
		}
		.mcnTextContent{
			word-break:break-word;
		}
		.mcnTextContent img{
			height:auto !important;
		}
		.mcnDividerBlock{
			table-layout:fixed !important;
		}
		body,#bodyTable{
			background-color:#FAFAFA;
		}
		#bodyCell{
			border-top:0;
		}
		.templateContainer{
			border:0;
		}
		h1{
			color:#202020;
			font-family:Helvetica;
			font-size:26px;
			font-style:normal;
			font-weight:bold;
			line-height:125%;
			letter-spacing:normal;
			text-align:left;
		}
		h2{
			color:#202020;
			font-family:Helvetica;
			font-size:22px;
			font-style:normal;
			font-weight:bold;
			line-height:125%;
			letter-spacing:normal;
			text-align:left;
		}
		h3{
			color:#202020;
			font-family:Helvetica;
			font-size:20px;
			font-style:normal;
			font-weight:bold;
			line-height:125%;
			letter-spacing:normal;
			text-align:left;
		}
		h4{
			color:#202020;
			font-family:Helvetica;
			font-size:18px;
			font-style:normal;
			font-weight:bold;
			line-height:125%;
			letter-spacing:normal;
			text-align:left;
		}
		#templatePreheader{
			background-color:#FAFAFA;
			background-image:none;
			background-repeat:no-repeat;
			background-position:center;
			background-size:cover;
			border-top:0;
			border-bottom:0;
			padding-top:9px;
			padding-bottom:9px;
		}
		#templatePreheader .mcnTextContent,#templatePreheader .mcnTextContent p{
			color:#656565;
			font-family:Helvetica;
			font-size:12px;
			line-height:150%;
			text-align:left;
		}
		#templatePreheader .mcnTextContent a,#templatePreheader .mcnTextContent p a{
			color:#656565;
			font-weight:normal;
			text-decoration:underline;
		}
		#templateHeader{
			background-color:#FFFFFF;
			background-image:none;
			background-repeat:no-repeat;
			background-position:center;
			background-size:cover;
			border-top:0;
			border-bottom:0;
			padding-top:9px;
			padding-bottom:0;
		}
		#templateHeader .mcnTextContent,#templateHeader .mcnTextContent p{
			color:#202020;
			font-family:Helvetica;
			font-size:16px;
			line-height:150%;
			text-align:left;
		}
		#templateHeader .mcnTextContent a,#templateHeader .mcnTextContent p a{
			color:#2BAADF;
			font-weight:normal;
			text-decoration:underline;
		}
		#templateBody{
			background-color:#FFFFFF;
			background-image:none;
			background-repeat:no-repeat;
			background-position:center;
			background-size:cover;
			border-top:0;
			border-bottom:2px solid #EAEAEA;
			padding-top:0;
			padding-bottom:9px;
		}
		#templateBody .mcnTextContent,#templateBody .mcnTextContent p{
			color:#202020;
			font-family:Helvetica;
			font-size:16px;
			line-height:150%;
			text-align:left;
		}
		#templateBody .mcnTextContent a,#templateBody .mcnTextContent p a{
			color:#295cdd;
			font-weight:normal;
			text-decoration:underline;
		}
		#templateFooter{
			background-color:#FAFAFA;
			background-image:none;
			background-repeat:no-repeat;
			background-position:center;
			background-size:cover;
			border-top:0;
			border-bottom:0;
			padding-top:9px;
			padding-bottom:9px;
		}
		#templateFooter .mcnTextContent,#templateFooter .mcnTextContent p{
			color:#656565;
			font-family:Helvetica;
			font-size:12px;
			line-height:150%;
			text-align:center;
		}
		#templateFooter .mcnTextContent a,#templateFooter .mcnTextContent p a{
			color:#656565;
			font-weight:normal;
			text-decoration:underline;
		}
	@media only screen and (min-width:768px){
		.templateContainer{
			width:600px !important;
		}

}	@media only screen and (max-width: 480px){
		body,table,td,p,a,li,blockquote{
			-webkit-text-size-adjust:none !important;
		}

}	@media only screen and (max-width: 480px){
		body{
			width:100% !important;
			min-width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		#bodyCell{
			padding-top:10px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnRetinaImage{
			max-width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImage{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnCartContainer,.mcnCaptionTopContent,.mcnRecContentContainer,.mcnCaptionBottomContent,.mcnTextContentContainer,.mcnBoxedTextContentContainer,.mcnImageGroupContentContainer,.mcnCaptionLeftTextContentContainer,.mcnCaptionRightTextContentContainer,.mcnCaptionLeftImageContentContainer,.mcnCaptionRightImageContentContainer,.mcnImageCardLeftTextContentContainer,.mcnImageCardRightTextContentContainer,.mcnImageCardLeftImageContentContainer,.mcnImageCardRightImageContentContainer{
			max-width:100% !important;
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnBoxedTextContentContainer{
			min-width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageGroupContent{
			padding:9px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnCaptionLeftContentOuter .mcnTextContent,.mcnCaptionRightContentOuter .mcnTextContent{
			padding-top:9px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageCardTopImageContent,.mcnCaptionBottomContent:last-child .mcnCaptionBottomImageContent,.mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent{
			padding-top:18px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageCardBottomImageContent{
			padding-bottom:9px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageGroupBlockInner{
			padding-top:0 !important;
			padding-bottom:0 !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageGroupBlockOuter{
			padding-top:9px !important;
			padding-bottom:9px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnTextContent,.mcnBoxedTextContentColumn{
			padding-right:18px !important;
			padding-left:18px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnImageCardLeftImageContent,.mcnImageCardRightImageContent{
			padding-right:18px !important;
			padding-bottom:0 !important;
			padding-left:18px !important;
		}

}	@media only screen and (max-width: 480px){
		.mcpreview-image-uploader{
			display:none !important;
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		h1{
			font-size:22px !important;
			line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
		h2{
			font-size:20px !important;
			line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
		h3{
			font-size:18px !important;
			line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
		h4{
			font-size:16px !important;
			line-height:150% !important;
		}

}	@media only screen and (max-width: 480px){
		.mcnBoxedTextContentContainer .mcnTextContent,.mcnBoxedTextContentContainer .mcnTextContent p{
			font-size:14px !important;
			line-height:150% !important;
		}

}	@media only screen and (max-width: 480px){
		#templatePreheader{
			display:block !important;
		}

}	@media only screen and (max-width: 480px){
		#templatePreheader .mcnTextContent,#templatePreheader .mcnTextContent p{
			font-size:14px !important;
			line-height:150% !important;
		}

}	@media only screen and (max-width: 480px){
		#templateHeader .mcnTextContent,#templateHeader .mcnTextContent p{
			font-size:16px !important;
			line-height:150% !important;
		}

}	@media only screen and (max-width: 480px){
		#templateBody .mcnTextContent,#templateBody .mcnTextContent p{
			font-size:16px !important;
			line-height:150% !important;
		}

}	@media only screen and (max-width: 480px){
		#templateFooter .mcnTextContent,#templateFooter .mcnTextContent p{
			font-size:14px !important;
			line-height:150% !important;
		}

}</style>
      <!--
-->
      <center>
        <table id="bodyTable" style="border-collapse:
          collapse;mso-table-lspace: 0pt;mso-table-rspace:
          0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust:
          100%;height: 100%;margin: 0;padding: 0;width:
          100%;background-color: #FAFAFA;" width="100%" border="0"
          cellspacing="0" cellpadding="0" align="center" height="100%">
          <tbody>
            <tr>
              <td id="bodyCell" style="mso-line-height-rule:
                exactly;-ms-text-size-adjust:
                100%;-webkit-text-size-adjust: 100%;height: 100%;margin:
                0;padding: 10px;width: 100%;border-top: 0;" valign="top"
                align="center">
                <!-- BEGIN TEMPLATE // -->
                <!--[if (gte mso 9)|(IE)]>
						<table align="center" border="0" cellspacing="0" cellpadding="0" width="600" style="width:600px;">
						<tr>
						<td align="center" valign="top" width="600" style="width:600px;">
						<![endif]-->
                <table class="templateContainer" style="border-collapse:
                  collapse;mso-table-lspace: 0pt;mso-table-rspace:
                  0pt;-ms-text-size-adjust:
                  100%;-webkit-text-size-adjust: 100%;border:
                  0;max-width: 600px !important;" width="100%"
                  border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td id="templatePreheader"
                        style="background:#FAFAFA none no-repeat
                        center/cover;mso-line-height-rule:
                        exactly;-ms-text-size-adjust:
                        100%;-webkit-text-size-adjust:
                        100%;background-color: #FAFAFA;background-image:
                        none;background-repeat:
                        no-repeat;background-position:
                        center;background-size: cover;border-top:
                        0;border-bottom: 0;padding-top:
                        9px;padding-bottom: 9px;" valign="top">
                        <table class="mcnTextBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust: 100%;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnTextBlockOuter">
                            <tr>
                              <td class="mcnTextBlockInner"
                                style="padding-top:
                                9px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;"
                                valign="top">
                                <!--[if mso]>
				<table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
				<tr>
				<![endif]-->
                                <!--[if mso]>
				<td valign="top" width="210" style="width:210px;">
				<![endif]-->
                                <table style="max-width:
                                  210px;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  class="mcnTextContentContainer"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0"
                                  align="left">
                                  <tbody>
                                    <tr>
                                      <td class="mcnTextContent"
                                        style="padding-top:
                                        0;padding-left:
                                        18px;padding-bottom:
                                        9px;padding-right:
                                        18px;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;word-break:
                                        break-word;color:
                                        #656565;font-family:
                                        Helvetica;font-size:
                                        12px;line-height:
                                        150%;text-align: left;"
                                        valign="top"> Get the latest
                                        news from DMTF! </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--[if mso]>
				</td>
				<![endif]-->
                                <!--[if mso]>
				<td valign="top" width="390" style="width:390px;">
				<![endif]-->
                                <table style="max-width:
                                  390px;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  class="mcnTextContentContainer"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0"
                                  align="left">
                                  <tbody>
                                    <tr>
                                      <td class="mcnTextContent"
                                        style="padding-top:
                                        0;padding-left:
                                        18px;padding-bottom:
                                        9px;padding-right:
                                        18px;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;word-break:
                                        break-word;color:
                                        #656565;font-family:
                                        Helvetica;font-size:
                                        12px;line-height:
                                        150%;text-align: left;"
                                        valign="top">                  
                                                                   <a
href="https://mailchi.mp/605a2ddf1002/new-redfish-schema-specification-and-developer-resources-now-available-1198185?e=4c4c04a315"
                                          target="_blank"
                                          style="mso-line-height-rule:
                                          exactly;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;color:
                                          #656565;font-weight:
                                          normal;text-decoration:
                                          underline;"
                                          moz-do-not-send="true">View
                                          this email in your browser</a>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--[if mso]>
				</td>
				<![endif]-->
                                <!--[if mso]>
				</tr>
				</table>
				<![endif]--> </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td id="templateHeader" style="background:#FFFFFF
                        none no-repeat
                        center/cover;mso-line-height-rule:
                        exactly;-ms-text-size-adjust:
                        100%;-webkit-text-size-adjust:
                        100%;background-color: #FFFFFF;background-image:
                        none;background-repeat:
                        no-repeat;background-position:
                        center;background-size: cover;border-top:
                        0;border-bottom: 0;padding-top:
                        9px;padding-bottom: 0;" valign="top">
                        <table class="mcnImageBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust: 100%;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnImageBlockOuter">
                            <tr>
                              <td style="padding:
                                9px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;"
                                class="mcnImageBlockInner" valign="top">
                                <table class="mcnImageContentContainer"
                                  style="min-width:
                                  100%;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0"
                                  align="left">
                                  <tbody>
                                    <tr>
                                      <td class="mcnImageContent"
                                        style="padding-right:
                                        9px;padding-left:
                                        9px;padding-top:
                                        0;padding-bottom: 0;text-align:
                                        center;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;" valign="top"> <img
                                          alt=""
src="https://gallery.mailchimp.com/917816ca36a7bf14f25723323/images/42c890f6-e679-4a28-bad3-da6bf8a83a25.png"
                                          style="max-width:
                                          640px;padding-bottom:
                                          0;display: inline
                                          !important;vertical-align:
                                          bottom;border: 0;height:
                                          auto;outline:
                                          none;text-decoration:
                                          none;-ms-interpolation-mode:
                                          bicubic;" class="mcnImage"
                                          moz-do-not-send="true"
                                          width="564" align="middle"> </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <table class="mcnDividerBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust:
                          100%;table-layout: fixed !important;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnDividerBlockOuter">
                            <tr>
                              <td class="mcnDividerBlockInner"
                                style="min-width: 100%;padding:
                                18px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;">
                                <table class="mcnDividerContent"
                                  style="min-width:
                                  100%;border-top-width:
                                  2px;border-top-style:
                                  solid;border-top-color:
                                  #EAEAEA;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0">
                                  <tbody>
                                    <tr>
                                      <td style="mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;"> <span></span> <br>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--
                <td class="mcnDividerBlockInner" style="padding: 18px;">
                <hr class="mcnDividerContent" style="border-bottom-color:none; border-left-color:none; border-right-color:none; border-bottom-width:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:0; margin-bottom:0; margin-left:0;" />
--> </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td id="templateBody" style="background:#FFFFFF
                        none no-repeat
                        center/cover;mso-line-height-rule:
                        exactly;-ms-text-size-adjust:
                        100%;-webkit-text-size-adjust:
                        100%;background-color: #FFFFFF;background-image:
                        none;background-repeat:
                        no-repeat;background-position:
                        center;background-size: cover;border-top:
                        0;border-bottom: 2px solid #EAEAEA;padding-top:
                        0;padding-bottom: 9px;" valign="top">
                        <table class="mcnTextBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust: 100%;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnTextBlockOuter">
                            <tr>
                              <td class="mcnTextBlockInner"
                                style="padding-top:
                                9px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;"
                                valign="top">
                                <!--[if mso]>
				<table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
				<tr>
				<![endif]-->
                                <!--[if mso]>
				<td valign="top" width="600" style="width:600px;">
				<![endif]-->
                                <table style="max-width: 100%;min-width:
                                  100%;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  class="mcnTextContentContainer"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0"
                                  align="left">
                                  <tbody>
                                    <tr>
                                      <td class="mcnTextContent"
                                        style="padding: 0px 18px
                                        9px;font-size: 13px;line-height:
                                        150%;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;word-break:
                                        break-word;color:
                                        #202020;font-family:
                                        Helvetica;text-align: left;"
                                        valign="top">
                                        <h1 style="display:
                                          block;margin: 0;padding:
                                          0;color: #202020;font-family:
                                          Helvetica;font-size:
                                          26px;font-style:
                                          normal;font-weight:
                                          bold;line-height:
                                          125%;letter-spacing:
                                          normal;text-align: left;">New
                                          Redfish Schema, Specification
                                          and Developer Resources Now
                                          Available </h1>
                                        <p style="text-align:
                                          left;font-size:
                                          13px;line-height: 150%;margin:
                                          10px 0;padding:
                                          0;mso-line-height-rule:
                                          exactly;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;color:
                                          #202020;font-family:
                                          Helvetica;"><span
                                            style="font-size:13px">With
                                            the aggressive development
                                            of its <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=44d86c7af6&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                              100%;-webkit-text-size-adjust:
                                              100%;color:
                                              #295cdd;font-weight:
                                              normal;text-decoration:
                                              underline;"
                                              moz-do-not-send="true">Redfish<sup>®</sup></a> standard,
                                            DMTF continues to address
                                            customer use cases and
                                            technology in converged IT
                                            infrastructure management.
                                            An API designed to deliver
                                            simple and secure management
                                            for hybrid IT and the
                                            Software Defined Data Center
                                            (SDDC), new versions of the
                                            Redfish schema and
                                            specification, as well as
                                            additional developer
                                            resources, are now
                                            available. <br>
                                             <br>
                                            New items just released
                                            include:</span><br>
                                           </p>
                                        <ul>
                                          <li
                                            style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><span
                                              style="font-size:13px"><strong> <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=ce75a26427&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                  100%;-webkit-text-size-adjust:
                                                  100%;color:
                                                  #295cdd;font-weight:
                                                  normal;text-decoration:
                                                  underline;"
                                                  moz-do-not-send="true">2018.1
                                                  Redfish Schema Bundle</a> </strong>–
                                              a .zip file that contains
                                              the current versions of
                                              all Redfish schema,
                                              including a new
                                              ExternalAccountProvider
                                              schema for
                                              LDAP/ActiveDirectory
                                              support. Additional schema
                                              updates enable support for
                                              Server Sent-Eventing
                                              (SSE), provide additional
                                              information for Processors
                                              and Settings, and more. </span></li>
                                          <li
                                            style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><span
                                              style="font-size:13px"><strong><a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=248be50edf&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                  100%;-webkit-text-size-adjust:
                                                  100%;color:
                                                  #295cdd;font-weight:
                                                  normal;text-decoration:
                                                  underline;"
                                                  moz-do-not-send="true">Redfish
                                                  Specification v1.5.0</a></strong> – adds
                                              new support for SSE,
                                              enabling the streaming of
                                              events to web-based GUIs
                                              and other clients. Other
                                              specification updates in
                                              this release include a
                                              mechanism for specifying
                                              deterministic behavior for
                                              the application of Create,
                                              Delete or Action (POST)
                                              operations. </span></li>
                                          <li
                                            style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><span
                                              style="font-size:13px"><strong><a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=250db000f5&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                  100%;-webkit-text-size-adjust:
                                                  100%;color:
                                                  #295cdd;font-weight:
                                                  normal;text-decoration:
                                                  underline;"
                                                  moz-do-not-send="true">Redfish
                                                  Resource and Schema
                                                  Guide</a> </strong>–
                                              new for 2018, this
                                              human-readable guide to
                                              the Redfish Schema is
                                              designed to help educate
                                              users of Redfish.
                                              Application developers and
                                              DevOps personnel creating
                                              client-side software to
                                              communicate with a Redfish
                                              service, as well as other
                                              consumers of the API, will
                                              benefit from the
                                              explanations in this
                                              resource. </span></li>
                                          <li
                                            style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><span
                                              style="font-size:13px"><strong><a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=6a78b9d068&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                  100%;-webkit-text-size-adjust:
                                                  100%;color:
                                                  #295cdd;font-weight:
                                                  normal;text-decoration:
                                                  underline;"
                                                  moz-do-not-send="true">Redfish
                                                  2018.1 Overview</a> </strong>–
                                              provides detailed
                                              descriptions of each
                                              revision in the latest
                                              version of the Redfish
                                              Schema and
                                              Specification.  </span></li>
                                          <li
                                            style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><span
                                              style="font-size:13px"><strong><a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=9019ba1b8e&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                  100%;-webkit-text-size-adjust:
                                                  100%;color:
                                                  #295cdd;font-weight:
                                                  normal;text-decoration:
                                                  underline;"
                                                  moz-do-not-send="true">Redfish
                                                  History – April 2018</a> </strong>–
                                              updated with each new
                                              release, this presentation
                                              offers a comprehensive
                                              view of each revision to
                                              Redfish since 2016.</span><br>
                                             </li>
                                        </ul>
                                        <p style="text-align:
                                          left;font-size:
                                          13px;line-height: 150%;margin:
                                          10px 0;padding:
                                          0;mso-line-height-rule:
                                          exactly;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;color:
                                          #202020;font-family:
                                          Helvetica;"><span
                                            style="font-size:13px">In
                                            addition to these new
                                            releases, the DMTF has
                                            improved and expanded the
                                            popular <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=68f0f3e179&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                              100%;-webkit-text-size-adjust:
                                              100%;color:
                                              #295cdd;font-weight:
                                              normal;text-decoration:
                                              underline;"
                                              moz-do-not-send="true">Redfish
                                              Developer Hub</a>, a
                                            one-stop, in-depth technical
                                            resource that provides all
                                            the files, tools, community
                                            support, tutorials and other
                                            advanced education
                                            developers may need to help
                                            use Redfish. Revamped with
                                            additional content and an
                                            improved navigation, the
                                            website’s intuitive design
                                            offers visitors faster
                                            access to new materials.<br>
                                             <br>
                                            To learn more about Redfish,
                                            click <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=260a4c97f9&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                              100%;-webkit-text-size-adjust:
                                              100%;color:
                                              #295cdd;font-weight:
                                              normal;text-decoration:
                                              underline;"
                                              moz-do-not-send="true">here</a> or
                                            - for developers - visit
                                            the <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=e9b009858e&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                              100%;-webkit-text-size-adjust:
                                              100%;color:
                                              #295cdd;font-weight:
                                              normal;text-decoration:
                                              underline;"
                                              moz-do-not-send="true">Redfish
                                              Developer Hub</a> today.
                                            Technical work on the
                                            Redfish standard takes place
                                            in the DMTF’s <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=3b2b07a0d7&amp;e=4c4c04a315"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                              100%;-webkit-text-size-adjust:
                                              100%;color:
                                              #295cdd;font-weight:
                                              normal;text-decoration:
                                              underline;"
                                              moz-do-not-send="true">Redfish
                                              Forum</a> (the group
                                            formerly known as the
                                            Scalable Platforms
                                            Management Forum).</span></p>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--[if mso]>
				</td>
				<![endif]-->
                                <!--[if mso]>
				</tr>
				</table>
				<![endif]--> </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td id="templateFooter" style="background:#FAFAFA
                        none no-repeat
                        center/cover;mso-line-height-rule:
                        exactly;-ms-text-size-adjust:
                        100%;-webkit-text-size-adjust:
                        100%;background-color: #FAFAFA;background-image:
                        none;background-repeat:
                        no-repeat;background-position:
                        center;background-size: cover;border-top:
                        0;border-bottom: 0;padding-top:
                        9px;padding-bottom: 9px;" valign="top">
                        <table class="mcnFollowBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust: 100%;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnFollowBlockOuter">
                            <tr>
                              <td style="padding:
                                9px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;"
                                class="mcnFollowBlockInner" valign="top"
                                align="center">
                                <table class="mcnFollowContentContainer"
                                  style="min-width:
                                  100%;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0">
                                  <tbody>
                                    <tr>
                                      <td style="padding-left:
                                        9px;padding-right:
                                        9px;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;" align="center">
                                        <table style="min-width:
                                          100%;border-collapse:
                                          collapse;mso-table-lspace:
                                          0pt;mso-table-rspace:
                                          0pt;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;"
                                          class="mcnFollowContent"
                                          width="100%" border="0"
                                          cellspacing="0"
                                          cellpadding="0">
                                          <tbody>
                                            <tr>
                                              <td style="padding-top:
                                                9px;padding-right:
                                                9px;padding-left:
                                                9px;mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                valign="top"
                                                align="center">
                                                <table
                                                  style="border-collapse:
collapse;mso-table-lspace: 0pt;mso-table-rspace:
                                                  0pt;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" border="0" cellspacing="0"
                                                  cellpadding="0"
                                                  align="center">
                                                  <tbody>
                                                    <tr>
                                                      <td
                                                        style="mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                        valign="top"
                                                        align="center">
                                                        <!--[if mso]>
                                    <table align="center" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                    <![endif]-->
                                                        <!--[if mso]>
                                        <td align="center" valign="top">
                                        <![endif]-->
                                                        <table
                                                          style="display:
inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-right:
10px;padding-bottom: 9px;mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;"
                                                          class="mcnFollowContentItemContainer"
                                                          valign="top">
                                                          <table
                                                          class="mcnFollowContentItem"
style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          width="100%"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-top:
5px;padding-right: 10px;padding-bottom: 5px;padding-left:
                                                          9px;mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          valign="middle"
                                                          align="left">
                                                          <table
                                                          style="border-collapse:
collapse;mso-table-lspace: 0pt;mso-table-rspace:
                                                          0pt;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" width="" border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          class="mcnFollowIconContent"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                          100%;-webkit-text-size-adjust:
                                                          100%;"
                                                          width="24"
                                                          valign="middle"
                                                          align="center">
                                                          <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=2fc377bc6e&amp;e=4c4c04a315"
target="_blank" style="mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" moz-do-not-send="true"><img
src="https://cdn-images.mailchimp.com/icons/social-block-v2/color-twitter-48.png"
style="display: block;border: 0;height: auto;outline:
                                                          none;text-decoration:
none;-ms-interpolation-mode: bicubic;" class="" moz-do-not-send="true"
                                                          width="24"
                                                          height="24"></a>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                        </table>
                                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                                        <!--[if mso]>
                                        <td align="center" valign="top">
                                        <![endif]-->
                                                        <table
                                                          style="display:
inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-right:
10px;padding-bottom: 9px;mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;"
                                                          class="mcnFollowContentItemContainer"
                                                          valign="top">
                                                          <table
                                                          class="mcnFollowContentItem"
style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          width="100%"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-top:
5px;padding-right: 10px;padding-bottom: 5px;padding-left:
                                                          9px;mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          valign="middle"
                                                          align="left">
                                                          <table
                                                          style="border-collapse:
collapse;mso-table-lspace: 0pt;mso-table-rspace:
                                                          0pt;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" width="" border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          class="mcnFollowIconContent"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                          100%;-webkit-text-size-adjust:
                                                          100%;"
                                                          width="24"
                                                          valign="middle"
                                                          align="center">
                                                          <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=bdc1d03f3c&amp;e=4c4c04a315"
target="_blank" style="mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" moz-do-not-send="true"><img
src="https://cdn-images.mailchimp.com/icons/social-block-v2/color-link-48.png"
style="display: block;border: 0;height: auto;outline:
                                                          none;text-decoration:
none;-ms-interpolation-mode: bicubic;" class="" moz-do-not-send="true"
                                                          width="24"
                                                          height="24"></a>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                        </table>
                                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                                        <!--[if mso]>
                                        <td align="center" valign="top">
                                        <![endif]-->
                                                        <table
                                                          style="display:
inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-right:
0;padding-bottom: 9px;mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;"
                                                          class="mcnFollowContentItemContainer"
                                                          valign="top">
                                                          <table
                                                          class="mcnFollowContentItem"
style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace:
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          width="100%"
                                                          border="0"
                                                          cellspacing="0"
cellpadding="0">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          style="padding-top:
5px;padding-right: 10px;padding-bottom: 5px;padding-left:
                                                          9px;mso-line-height-rule:
exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"
                                                          valign="middle"
                                                          align="left">
                                                          <table
                                                          style="border-collapse:
collapse;mso-table-lspace: 0pt;mso-table-rspace:
                                                          0pt;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" width="" border="0"
                                                          cellspacing="0"
cellpadding="0" align="left">
                                                          <tbody>
                                                          <tr>
                                                          <td
                                                          class="mcnFollowIconContent"
style="mso-line-height-rule: exactly;-ms-text-size-adjust:
                                                          100%;-webkit-text-size-adjust:
                                                          100%;"
                                                          width="24"
                                                          valign="middle"
                                                          align="center">
                                                          <a
href="https://dmtf.us12.list-manage.com/track/click?u=917816ca36a7bf14f25723323&amp;id=f18fd3af01&amp;e=4c4c04a315"
target="_blank" style="mso-line-height-rule:
                                                          exactly;-ms-text-size-adjust:
100%;-webkit-text-size-adjust: 100%;" moz-do-not-send="true"><img
src="https://cdn-images.mailchimp.com/icons/social-block-v2/color-youtube-48.png"
style="display: block;border: 0;height: auto;outline:
                                                          none;text-decoration:
none;-ms-interpolation-mode: bicubic;" class="" moz-do-not-send="true"
                                                          width="24"
                                                          height="24"></a>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                          </table>
                                                          </td>
                                                          </tr>
                                                          </tbody>
                                                        </table>
                                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                                        <!--[if mso]>
                                    </tr>
                                    </table>
                                    <![endif]--> </td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                              </td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <table class="mcnDividerBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust:
                          100%;table-layout: fixed !important;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnDividerBlockOuter">
                            <tr>
                              <td class="mcnDividerBlockInner"
                                style="min-width: 100%;padding: 10px
                                18px 25px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;">
                                <table class="mcnDividerContent"
                                  style="min-width:
                                  100%;border-top-width:
                                  2px;border-top-style:
                                  solid;border-top-color:
                                  #EEEEEE;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0">
                                  <tbody>
                                    <tr>
                                      <td style="mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;"> <span></span> <br>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--
                <td class="mcnDividerBlockInner" style="padding: 18px;">
                <hr class="mcnDividerContent" style="border-bottom-color:none; border-left-color:none; border-right-color:none; border-bottom-width:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:0; margin-bottom:0; margin-left:0;" />
--> </td>
                            </tr>
                          </tbody>
                        </table>
                        <table class="mcnTextBlock" style="min-width:
                          100%;border-collapse:
                          collapse;mso-table-lspace:
                          0pt;mso-table-rspace:
                          0pt;-ms-text-size-adjust:
                          100%;-webkit-text-size-adjust: 100%;"
                          width="100%" border="0" cellspacing="0"
                          cellpadding="0">
                          <tbody class="mcnTextBlockOuter">
                            <tr>
                              <td class="mcnTextBlockInner"
                                style="padding-top:
                                9px;mso-line-height-rule:
                                exactly;-ms-text-size-adjust:
                                100%;-webkit-text-size-adjust: 100%;"
                                valign="top">
                                <!--[if mso]>
				<table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
				<tr>
				<![endif]-->
                                <!--[if mso]>
				<td valign="top" width="600" style="width:600px;">
				<![endif]-->
                                <table style="max-width: 100%;min-width:
                                  100%;border-collapse:
                                  collapse;mso-table-lspace:
                                  0pt;mso-table-rspace:
                                  0pt;-ms-text-size-adjust:
                                  100%;-webkit-text-size-adjust: 100%;"
                                  class="mcnTextContentContainer"
                                  width="100%" border="0"
                                  cellspacing="0" cellpadding="0"
                                  align="left">
                                  <tbody>
                                    <tr>
                                      <td class="mcnTextContent"
                                        style="padding-top:
                                        0;padding-right:
                                        18px;padding-bottom:
                                        9px;padding-left:
                                        18px;mso-line-height-rule:
                                        exactly;-ms-text-size-adjust:
                                        100%;-webkit-text-size-adjust:
                                        100%;word-break:
                                        break-word;color:
                                        #656565;font-family:
                                        Helvetica;font-size:
                                        12px;line-height:
                                        150%;text-align: center;"
                                        valign="top"> <em>Copyright ©
                                          2018 DMTF, Inc All rights
                                          reserved.</em><br>
                                        1001 SW 5th Avenue, #1100<br>
                                        Portland, OR 97204<br>
                                        <br>
                                        Want to change how you receive
                                        these emails?<br>
                                        You can <a
href="https://dmtf.us12.list-manage.com/profile?u=917816ca36a7bf14f25723323&amp;id=0f342f56d6&amp;e=4c4c04a315"
                                          style="mso-line-height-rule:
                                          exactly;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;color:
                                          #656565;font-weight:
                                          normal;text-decoration:
                                          underline;"
                                          moz-do-not-send="true">update
                                          your preferences</a> or <a
href="https://dmtf.us12.list-manage.com/unsubscribe?u=917816ca36a7bf14f25723323&amp;id=0f342f56d6&amp;e=4c4c04a315&amp;c=48317526ed"
                                          style="mso-line-height-rule:
                                          exactly;-ms-text-size-adjust:
                                          100%;-webkit-text-size-adjust:
                                          100%;color:
                                          #656565;font-weight:
                                          normal;text-decoration:
                                          underline;"
                                          moz-do-not-send="true">unsubscribe
                                          from this list</a> </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!--[if mso]>
				</td>
				<![endif]-->
                                <!--[if mso]>
				</tr>
				</table>
				<![endif]--> </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <!--[if (gte mso 9)|(IE)]>
						</td>
						</tr>
						</table>
						<![endif]-->
                <!-- // END TEMPLATE --> </td>
            </tr>
          </tbody>
        </table>
      </center>
      <img
src="https://dmtf.us12.list-manage.com/track/open.php?u=917816ca36a7bf14f25723323&amp;id=48317526ed&amp;e=4c4c04a315"
        moz-do-not-send="true" width="1" height="1">
    </div>
  </body>
</html>

--------------D47F2CDF5D06486C1B7C6A98--
