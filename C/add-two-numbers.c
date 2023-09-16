#include <stdio.h>
#include <stdlib.h>

// Definition for a single number in our linked list.
struct ListNode {
    int val;             // This is like a box that holds a number.
    struct ListNode *next; // This is like a pointer that shows where the next box is.
};

// Function to add two numbers represented by linked lists
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    // We create a special box called 'dummyHead' to help us get started.
    struct ListNode* dummyHead = (struct ListNode*)malloc(sizeof(struct ListNode));
    struct ListNode* current = dummyHead; // This is like our helper who moves along the boxes.
    int carry = 0; // This is like if we have extra when adding, we remember it here.

    // We go through the boxes in the linked lists until there are no more boxes.
    while (l1 != NULL || l2 != NULL) {
        int x = (l1 != NULL) ? l1->val : 0; // This is like taking a number from box 1 (l1).
        int y = (l2 != NULL) ? l2->val : 0; // This is like taking a number from box 2 (l2).
        int sum = x + y + carry; // We add the numbers from both boxes and any extra from before.
        carry = sum / 10; // If the sum is more than 10, we keep some extra for later.

        // We create a new box with the result of the addition and connect it to the previous box.
        current->next = (struct ListNode*)malloc(sizeof(struct ListNode));
        current->next->val = sum % 10; // We keep only the last digit of the sum.
        current->next->next = NULL; // This new box doesn't point to any other box for now.

        current = current->next; // Our helper moves to the new box we just created.

        if (l1 != NULL) l1 = l1->next; // If there's another box in l1, we move to it.
        if (l2 != NULL) l2 = l2->next; // If there's another box in l2, we move to it.
    }

    // If we still have some extra left after all the adding, we create a new box for it.
    if (carry > 0) {
        current->next = (struct ListNode*)malloc(sizeof(struct ListNode));
        current->next->val = carry; // This box holds our extra.
        current->next->next = NULL; // This new box doesn't point to any other box.
    }

    // We're done with the 'dummyHead' box, so we return the result starting from the next box.
    struct ListNode* result = dummyHead->next;
    free(dummyHead); // We clean up the special box we created at the beginning.
    return result;
}

// Helper function to create a new box with a number in it.
struct ListNode* newNode(int val) {
    struct ListNode* node = (struct ListNode*)malloc(sizeof(struct ListNode));
    node->val = val; // We put the number in the box.
    node->next = NULL; // This new box doesn't point to any other box for now.
    return node;
}

// Helper function to print the numbers in our boxes (linked list).
void printList(struct ListNode* list) {
    while (list != NULL) { // We go through all the boxes.
        printf("%d -> ", list->val); // We look inside the box and print the number.
        list = list->next; // We move to the next box.
    }
    printf("NULL\n"); // When there are no more boxes, we say "NULL."
}

int main() {
    // Example usage:

    // We create two linked lists with numbers in boxes.
    struct ListNode* l1 = newNode(2);
    l1->next = newNode(4);
    l1->next->next = newNode(3);

    struct ListNode* l2 = newNode(5);
    l2->next = newNode(6);
    l2->next->next = newNode(4);

    // We call our function to add the numbers in the linked lists.
    struct ListNode* result = addTwoNumbers(l1, l2);

    // We print the input linked lists and the result.
    printf("Input l1: ");
    printList(l1);
    printf("Input l2: ");
    printList(l2);
    printf("Output: ");
    printList(result);

    // We clean up the memory used by the linked lists and the result.
    while (l1 != NULL) {
        struct ListNode* temp = l1;
        l1 = l1->next;
        free(temp);
    }
    while (l2 != NULL) {
        struct ListNode* temp = l2;
        l2 = l2->next;
        free(temp);
    }
    while (result != NULL) {
        struct ListNode* temp = result;
        result = result->next;
        free(temp);
    }

    return 0;
}
