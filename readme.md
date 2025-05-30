# B5A2 Wildlife Conservation Monitoring Assignment

# PostgreSQL Interview Questions and Answers (Bengali)

## 1. **What is PostgreSQL?**

**Answer:**  
PostgreSQL হলো একটি শক্তিশালী SQL ভিত্তিক ডেটাবেস সফটওয়্যার, যেটা ব্যবহার করে আপনি বড় বড় ওয়েব অ্যাপ, সফটওয়্যার, অ্যানালাইটিকস প্ল্যাটফর্মে তথ্য সংরক্ষণ ও পরিচালনা করতে পারেন। এটি একটি ফ্রি এবং ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যার মাধ্যমে আপনি তথ্য (ডেটা) সংরক্ষণ, ম্যানেজ ও বিশ্লেষণ করতে পারেন।

**কেন PostgreSQL ব্যবহার করা হয়?**

1. Enterprise-grade অ্যাপ্লিকেশনের জন্য (ব্যাংকিং, হেলথ, ই-কমার্স)
2. ওপেন সোর্স ও ফ্রি — লাইসেন্স খরচ নেই
3. ডেটা বিশ্লেষণ ও রিলেশনাল অপারেশন চালাতে শক্তিশালী
4. MySQL এর চাইতে অনেক বেশি ফিচারড ও স্ট্যান্ডার্ড SQL Friendly
5. বড় সিস্টেমে Scalability ও Performance ভালো
6. ACID (Atomicity, Consistency, Isolation, Durability)-কমপ্লায়েন্ট (তাই ডেটা লসের ঝুঁকি কম)

---

## 2. **What is the purpose of a database schema in PostgreSQL?**

**Answer:**  
**সংজ্ঞা (Definition):**  
Schema হলো একটি ডেটাবেসের ভিতরে ছোট ছোট "অলাদা ঘর" (namespace) — যেখানে আপনি টেবিল, ভিউ, ফাংশন, ট্রিগার ইত্যাদি সাজিয়ে রাখতে পারেন। অর্থাৎ, একটি ডেটাবেজে অনেকগুলি স্কিমা থাকতে পারে, আর প্রতিটি স্কিমার নিজস্ব টেবিল, ফাংশন ইত্যাদি থাকে।

**উদ্দেশ্য (Purpose of Schema):**

| **উদ্দেশ্য**                  | **বিস্তারিত**                                                                 |
| ----------------------------- | ----------------------------------------------------------------------------- |
| **Organization**              | বড় প্রজেক্টের বিভিন্ন অংশ আলাদা করে গুছিয়ে রাখা যায়                           |
| **Security**                  | প্রতিটি স্কিমায় আলাদা পারমিশন দেওয়া যায়                                       |
| **Naming Conflict Avoidance** | একই নামের টেবিল বা ফাংশন স্কিমা ভেদে আলাদা রাখা যায়                           |
| **Multi-user Collaboration**  | এক ডেটাবেজে একাধিক টিম একসাথে কাজ করতে পারে, কিন্তু স্কিমা অনুযায়ী আলাদা থাকে |
| **Modularity**                | SAAS বা Multi-tenant অ্যাপে প্রতিটি কোম্পানির জন্য আলাদা স্কিমা রাখা যায়      |

**আপনি কখন Schema ব্যবহার করবেন?**

| **আপনার দরকার**                | **Schema দরকার?**              |
| ------------------------------ | ------------------------------ |
| একটা ছোট প্রজেক্ট              | ❌ না, default public ই যথেষ্ট |
| বড় সফটওয়্যার বা SAAS           | ✅ হ্যাঁ                       |
| Multi-tenancy                  | ✅ হ্যাঁ                       |
| ইউজারভিত্তিক Access Control    | ✅ হ্যাঁ                       |
| একাধিক টিম এক ডেটাবেজে কাজ করে | ✅ হ্যাঁ                       |

---

## 3. **Explain the Primary Key and Foreign Key concepts in PostgreSQL.**

**Answer:**  
**Primary Key** হল একটি টেবিলের এমন একটি কলাম (বা একাধিক কলামের সংমিশ্রণ), যা প্রত্যেকটি রেকর্ডকে ইউনিকভাবে (অদ্বিতীয়ভাবে) চিহ্নিত করে।

**বৈশিষ্ট্য:**

1. প্রতিটি রেকর্ডে এর মান অবশ্যই ইউনিক (unique) হতে হবে।
2. কখনোই NULL হতে পারবে না।
3. একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে।

**Foreign Key** হল এমন একটি কলাম, যেটি অন্য টেবিলের **Primary Key-এর রেফারেন্স (reference)** হিসেবে কাজ করে। এটি দুইটি টেবিলের মধ্যে **সম্পর্ক (relationship)** তৈরি করে।

**বৈশিষ্ট্য:**

1. এটি যে টেবিলের রেফারেন্স দেয়, সেই টেবিলের **Primary Key বা Unique Key** হতে হবে।
2. এটি বর্তমান টেবিলের মানকে কন্ট্রোল করে (কোন invalid বা unmatched ডেটা ঢুকতে দেয় না)।
3. Foreign Key এর মান NULL হতে পারে (যদি সম্পর্ক না থাকে)।

**ব্যবহার:**  
দুইটা টেবিলের মধ্যে সম্পর্ক (Relation) তৈরি করতে।

**কেন ব্যবহার করি?**

| **Key Type**    | **উদ্দেশ্য (Purpose)**                  | **ব্যাখ্যা**                                     |
| --------------- | --------------------------------------- | ------------------------------------------------ |
| **Primary Key** | প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করতে | যেমন: প্রতিটি ছাত্রের ইউনিক আইডি                 |
| **Foreign Key** | দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করতে   | যেমন: ছাত্র কোন ডিপার্টমেন্টে পড়ে তা সংযুক্ত করা |

---

## 4. **What is the difference between the VARCHAR and CHAR data types?**

**Answer:**  
**CHAR(n):** Fixed-length character string (ঠিক n সংখ্যক অক্ষর রাখবে)।  
**VARCHAR(n):** Variable-length character string (সর্বোচ্চ n সংখ্যক অক্ষর রাখতে পারবে, যতটুকু দরকার ততটুকু ব্যবহার করবে)।

**টেকনিক্যাল পার্থক্য:**

| **Feature** | **CHAR(n)**                             | **VARCHAR(n)**                     |
| ----------- | --------------------------------------- | ---------------------------------- |
| Length      | Fixed (n)                               | Variable (up to n)                 |
| Storage     | Always takes n space                    | Takes only required space          |
| Padding     | Adds spaces to fill length              | No padding                         |
| Performance | Slightly faster for fixed-length values | More efficient for variable text   |
| Use-case    | Small, consistent size fields           | User names, descriptions, comments |

**কোথায় কী ব্যবহার করবেন?**

| **ব্যবহার ক্ষেত্র** | **ব্যবহার করুন**        | **কারণ**                                          |
| ------------------- | ----------------------- | ------------------------------------------------- |
| দেশ কোড (BD, US)    | CHAR(2)                 | সব দেশ কোড ২ অক্ষরের                              |
| জেন্ডার (M/F)       | CHAR(1)                 | ফিক্সড                                            |
| ফোন নাম্বার         | VARCHAR(15)             | সব ফোন নাম্বার এক রকম না                          |
| ইউজার নাম           | VARCHAR(50)             | কেউ ছোট, কেউ বড় নাম লিখবে                         |
| সিএনআইসি / NID      | CHAR(10) বা VARCHAR(17) | যদি সবসময় নির্দিষ্ট দৈর্ঘ্য হয়, CHAR ব্যবহার করুন |

**✅ Bonus: Practical Example**

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    gender CHAR(1),        -- M / F
    country_code CHAR(2),  -- BD / US
    username VARCHAR(30),  -- Variable name
    bio VARCHAR(255)       -- Optional long text
);

```

---

## 5. **Explain the purpose of the WHERE clause in a SELECT statement.**

**Answer:**
WHERE clause ব্যবহার করা হয় **ডেটা ফিল্টার** করার জন্য। এটি আপনাকে ডেটাবেজ থেকে শুধুমাত্র সেইসব রেকর্ড (তথ্য) নির্বাচন করতে সাহায্য করে যা নির্দিষ্ট শর্ত পূরণ করে।

### 🎯 উদাহরণ:

ধরুন, আপনার একটি `students` নামের টেবিল আছে:

| **id** | **name** | **age** |
| ------ | -------- | ------- |
| 1      | Rakib    | 20      |
| 2      | Anika    | 17      |
| 3      | Shanto   | 21      |

**✅ Query:**

```sql
SELECT name FROM students WHERE age > 18;
```

** Result: **
শুধুমাত্র সেইসব ছাত্রদের নাম যাদের বয়স ১৮ বছরের বেশি (Rakib এবং Shanto)।

\*\* WHERE clause কেন দরকার?
আপনি সব সময় সব ডেটা চান না, শুধুমাত্র নির্দিষ্ট শর্ত পূরণকারী ডেটা চান।

**উদাহরণস্বরূপ:**

বয়স ১৮ এর বেশি এমন ছাত্র

বাংলাদেশি ইউজার

সক্রিয় ইউজার (যেখানে active = true)

** 📌 মনে রাখবেন: **

SELECT দিয়ে আপনি বলেন "কি আনবেন?"

WHERE দিয়ে বলেন "কি শর্তে আনবেন?"

---

## Abdul Wahed Nur

## About

I’m Abdul Wahed Nur, an enthusiastic and self-driven learner passionate about full-stack development, database systems, and real-world problem solving. Currently expanding my skills in PostgreSQL, JavaScript, and modern web technologies while building a solid foundation in back-end development.

I believe in writing clean, maintainable code and love transforming ideas into real applications that have social and practical impact. 🌱

**_ Currently working on my personal website and portfolio. Stay tuned for updates! _**

## Skills & Expertise

**Languages:** SQL, JavaScript, TypeScript, Python (learning)

**Databases:** PostgreSQL, MongoDB, MySQL (basics)

**Technology:** React, Nextjs, Redux,

**Web:** HTML5, CSS3, Git, GitHub

**Others:** Markdown, VS Code, CLI

## 📁 Featured Projects

Personal Portfolio Website (Coming soon)

## Connect With Me

[Email](mailto:wahednur@gmail.com) | [LinkedIn](https://www.linkedin.com/in/wahednur/) | [GitHub](https://github.com/wahednur) | Mobile: +88 01917839303

_Note: Website and portfolio links will be updated soon._
